#!/bin/bash

read -p "Introduce una ruta: " ruta

if [ ! -e $ruta ]; then
	echo "Esta ruta NO existe"
	exit 1
fi

if [ -d $ruta ]; then
	echo "Y es un directorio normal"
fi

if [ -f $ruta -a -w $ruta ]; then
	echo "y es un fichero y se puede escribir"
fi
