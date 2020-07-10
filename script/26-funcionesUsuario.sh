#!/bin/bash

# Mostrar informacion de los usuarios de un grupo
#   1- espacio usaod por su directorio personal
#   2- Saber si está actualmente logueado en el sistema y en cas
#      contrario, conocer cuando fue la ultima vez.


function info {

    IFS=':'
    
    user=($1);
    echo "** INFORMACION PARA ${user[0]}**"
    echo "El espacio ocupado por su direct. personal ${user[5]}   es: " $(du -sh ${user[5]} | cut -f1)

    if $(who | egrep "^${user[0]}\b" &> /dev/null); then
        echo "Actualmente esta en el sistema"
    else
        acceso=$(grep opened.*${user[0]} /var/log/auth.log | tail -n1 | tr -s " " | cut -d" " -f1-3)
        if [ -z "$acceso" ]; then
            echo "Nunca a entrado al sistema"
        else
            echo "y su ultimo acceso fue: $acceso"
        fi
    fi

    IFS=' '
}

read -p "Introduzca el nombre del grupo: " grupo
gid=$(egrep ^$grupo: /etc/group | cut -d":" -f3)
usuarios=$(egrep "^\w+:x:\w+:$gid:" /etc/passwd)

if [ -z "$usuarios" ]; then
    echo "No se han encontrado usuarios"
    exit 1
fi

for u in $usuarios; do 
    info $u 
done


