#!/bin/bash

#
# problemaprograma para seleccionar el estado de una nota
#

read -p "Introduzca la nota numerica: " nota

case $nota in 
	9|10)
		echo "Tienes sobresaliente";;
	[87])
		echo "Tienes notable";;
	6)
		echo "Tienes bien";;
	5)
		echo "Tienes aprobado";;
	[43210])
		echo "Has suspendido";;
	*)
		echo "Nota incorrecta";;
esac

