#!/bin/bash

#test $1 = "suma" && resultado=$(($v1+$v2))

# no imprime nada por consola porque si existe sucho como usuario.
id sucho &> /dev/null || echo "Ham no existe"

# al ser verdadero me imprimirar por consola
# si quiero desechar lo que me imprime lo envio a &> /dev/null
ping -c1 www.google.com.ar &> /dev/null && echo "Google esta activo"


ping -c1 www.googlewqwqw.com.ar &> /dev/null || echo "Google esta INactivo"

