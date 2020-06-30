#!/bin/bash

# continue: rompe la ejecucion pero sigue con la otra instruccion
# break: rompe la ejecucion del proceso y lo termina

# encuentra ficheros vacios en un directorio

for fichero in $( ls /var/log ); do 
    if [ -e /var/log/$fichero -a ! -s /var/log/$fichero ]; then
        #echo El $fichero esta vacios
        break # si solo quiero al primer elemento
    fi
done

for fichero in $( ls /var/log ); do
    if [ $(du "/var/log/$fichero" | cut -f1) -eq 0 ]; then
        echo El $fichero esta vacio 
    fi
done