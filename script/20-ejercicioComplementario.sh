#!/bin/bash

# Este script hara lo siguiente
# 1 - Comprobar si hay conexion con www.curse.me
# 2 - Descargar un fichero y mostrar si se realizo correctamente
# 3 - Decir si el fichero es grande o pequeño, y mostrar cuanto ocupa

ping -c1 www.cursea.me &> /dev/null || exit 1 

wget http://www.cursea.me/poemas.tar.gz &> /dev/null && echo 'Fichero descargado correctamente'

# con cut -f1 le corto el segundo parametro que devuelve
size=$(du  poemas.tar.gz | cut -f1)

echo "El tamanio del archivo descargado es: ${size}"

if [ $size -gt 1000 ]; then
    echo El fichero es grande
else
    echo El fichero es pequenio
fi