#!/bin/bash

#
# problemaprograma para seleccionar el estado de una nota
#

read -p "Introduzca la nota numerica: " nota

if [ $nota -ge 9 ]; then
	echo "Tienes sobresaliente"
elif [ $nota -ge 7 ]; then
	echo "Tienes notable"
elif [ $nota -ge 6 ]; then
	echo "Tienes bien"
elif [ $nota -ge 5 ]; then
	echo "Tienes aprobado"
else
	echo "Has suspendido"
fi

