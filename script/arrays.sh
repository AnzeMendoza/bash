#!/bin/bash

myArray=(dato1 dato2 dato3)
echo ${myArray[0]}
echo ${myArray[1]}
echo ${myArray[2]}
echo ${myArray[-1]}
echo myArray[@]: ${myArray[@]}
echo la cantidad de elementos es ${#myArray[@]}
echo los indices disponibles son ${!myArray[@]}
unset myArray[1]
echo DESPUES DE BORRAR
echo myArray[@]: ${myArray[@]}
echo la cantidad de elementos es ${#myArray[@]}
echo los indices disponibles son ${!myArray[@]}

