## Enviar texto a la salida estándar. Comando ECHO

- **echo** : muestra el texto que recibe.
    - **-e**: interpreta los caracteres especiales después de /

```sh
echo "Hola Mundo"
echo -e "Hola \t Mundo"
```

la segunda instruccion le da un tab.

```sh
echo "El usuario activo: $USER"
echo 'El usuario activo: $USER'
echo "multiplicación: $((50*10))"
```
La primera opcion muestra la variable, mientras que la segunda muestra la cadena literal, esa es la diferencia entre **comillas simples y dobles**
. La tercera instrucción nos muestra el producto, **ojo con el doble parentesis**

##  Mostrar contenido de ficheros de texto. CAT, MORE y LESS

- **cat**: Puede concatenarse ficheros de texto.Se suele usar para mostrar su contenido por pantalla.
    - **-n**: muestra el número de lineas de texto.

```sh
echo /etc/issue
```
Me va a mostra la version de GNU/linux instalado.

```sh
echo -n /etc/network/intefaces
```

Muestra la configuración de la red, y con el parametro **-n** me muestra el numero de linea.

- **more**: Puede concatenarse ficheros de texto.Simil a cat pero puedo moverme progresivamente con el **enter** o pantalla por pantalla con el **space**. Con el boton **h** me muestra muchas opciones.

- **less**: Puede concatenarse ficheros de texto. Con el boton **h** me muestra muchas opciones. Esta mas optimizado que **more**.

##  Seleccionar primeras o últimas lineas: HEAD y TAIL

- **head**: Si queremos ver las primeras lineas. Por defecto muestra las primeras diez.
    - **-nX o -X**: siendo **X** el numero de lineas que quiero mostrar.
- **tail**: Si queremos ver las ultimas lineas.  Por defecto muestra las ultimas diez.

Los dos pueden trabajar con varios archivos, por ende me mostraria los **X** lineas de varios archivos. Me agrega el nombre del archivo como separador con **-q** las puedo sacar.

```sh
tail -n5 /var/log/*
```

## Seleccionar partes de una linea: CUT

- **cut**: Muestra sólo una parte de cada linea. Hace un "corte" vertical.
    - **-c <[(m-n) | (m,n)]>** : Selecciona solo los caracteres que le indiquemos. Se pueden utilizar números independientes separados por comas o dos números separados por guión par indicar el inicio o fin de un rango. Si alguno no está presente se entiende que será el inicio o fin de linea.
    - **-d** : Indica un carácter separador entre los distintos campos de una linea. Así podremos seleccionar la información por columnas. Por defecto es el carácter tabulador.
    -- **-f** : **SIEMPRE VA ASOCIADA CON -d** Elige las columnas que queremos que se muestren. La forma de seleccionar funciona igual que para la opción **-c**.

```sh
cut -c 5,10 etc/passwd
cut -c 5,10 etc/passwd
cut -c 5,10-15,22 etc/passwd
```
El primero me mostraria lo que contenga el archivo etc/passwd desde el 5 y 10.
El segundo lo que contenga el archivo etc/passwd solo el 5 y 10.
La tercera opción es una combinación de ambas.

```sh
cut -d ":" -f1-5 etc/passwd
cut -d ":" -f1,7 etc/passwd
```
La primera linea me mostraria todos los campos delimitados por los ":", de la columna 1 al 5.
Mientras que otra instrucción me muestra solamente la columna 1 y la 7.

## Filtrar sólo las lineas que contengan un patrón: GREP

- **grep**: Muestra sólo las linesas que cimplen con un patrón. Se pueden usar las palabras o expresiones regulares.
    - **-v** : Muestra las que NO coinciden con el patron.
    - **-l** : Sólo indica el nombre del archivo donde se ha encontrado alguna coincidencia.
    - **-w** : El patrón tiene que se una palabra independiente.
    - **-n** : Indica el número de linea.
    - **-i** : No distingue entre mayúscula y minúscula.
    - **-c** : Muestra la cantidad de lineas que cumplen con el patron.
    - **-r** : Busca en los fichero de forma recursiva.

```sh
grep root etc/passwd
```
Muestra el usuario root de mi sistema.