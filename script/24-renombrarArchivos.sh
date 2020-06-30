#!/bin/bash

# Los nombres de los ficherotienen que ser codigo_curso-codigo-video-nombre
# importante que no se usen guiones en nungun otro lugar

# IFS es por defecto /t/n, lo que estaria haciendo es cambiarlo
# por el - y despues volver al anterior

OLDIFS=$IFS

i=0
for n in *.mp4; do
    IFS="-"
    partes=($n)
    mv "$n" "${partes[0]}-V$(printf "%02d" $i) -${partes[2]}"
    i=$(($i+1))
done
IFS=$OLDIFS

#print es para que maneje dos digitos