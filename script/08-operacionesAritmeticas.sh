#!/bin/bash

read -p "Introduzca el primer numero: " n1
read -p "Introduzca el segundo numero: " n2

echo "La suma es $(($n1+$n2))"
echo "La resta  es $(($n1-$n2))"
echo "El producto es $(($n1*$n2))"
echo "La division es $(($n1/$n2))"
echo "El resto es $(($n1%$n2))"
