#!/bin/bash

cont=0

while [ $cont -lt 5 ]; do
    echo el contador es $cont
    cont=$((cont+1)) # $(($cont+1)) tambien funciona
done



for i in $(seq 5 8); do
    echo variable i = $i
done


for j in Goku Vegeta Picollo Gohan; do
    echo variable j = $j
done


#porque lo abri desde un nivel mas arriba que el .sh sino no va /script
for nombre in $(ls ./script *.sh); do 
    echo $nombre
done
