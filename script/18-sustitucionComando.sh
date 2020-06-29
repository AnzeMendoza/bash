#!/bin/bash
NOW=$(date +"%F %R")

echo fecha actual: $NOW
echo solo el dia: $(date +"%d")

echo El directorio actual ocupa: `du -sh .`

# La variable $? contiene el resultado de ultimo comando ejecutado
# 0 si se ejecuto de manera correcta
# distinto de 0 si no se ejecuto corractamente.

echo si se retorna 0 es porque la operacion fue exitosa: $?

ls -d /etc/
echo imprime 0 si existe el directorio: $?

ls -d /noexiste/
echo imprime un codigo distinto de 0 si NO existe el directorio: $?

# con /dev/null mando el stream ahi, por lo tanto no se imprime por consola
ls -d /noexiste/ &> /dev/null
echo imprime un codigo distinto de 0 si NO existe el directorio: $?
