#!/bin/bash

read -p "Introduce una ruta: " ruta

if [  -e $ruta ]; then
	if [ -d $ruta ]; then
		echo "Es un directorio normal"
	elif [ -f $ruta -a -w $ruta ]; then
		echo "Es un fichero y se puede escribir"
	fi
else
	echo "Esta ruta NO existe"
fi
