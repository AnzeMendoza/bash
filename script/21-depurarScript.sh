#!/bin/bash -xv

# ejecutar ~ /bin/bash -x ./<nombreDelScript>

numero=$RANDOM
echo El numero es $numero
resto=$(($numero%2))

if [ $resto -eq 0 ]; then # aca esta el problema cambio el = por -eq
    echo El numero es par
else
    echo El numero es impar
fi