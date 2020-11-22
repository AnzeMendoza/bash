### Espacio usado en disco: DU y DF

**df (disk free)**: Este comando nos da información sobre las particiones del sistema: tamaño total, usado y libre. Podemos usarlo sin opciones ni argumentos, pero la opción **-h** nos ayudara a entender mejor las cifras que se nos muestran.
Si le pasamos como parámetro cualquier directorio nos dará la información de la partición donde se encuentre ese directorio.

#### ejemplo

```sh
df -h /home/
```
La salida que nos da el comando ejemplo.
```sh
S.ficheros     Tamaño Usados  Disp Uso% Montado en
/dev/sda1        217G   111G   95G  54% /
```
Muestra en formato "humano" información sobre el espacio de la partición donde se encuentre **/home/**

**du (disk usage)**: Muestra el espacio de disco ocupado por un fichero o por un directorio. Si le pasamos un directorio mostrará recursivamente el tamaño de todos los directorios(no recomendable).
- h : muestra el tamaño en KB, MB, etc.
- s : Si le pasamos un directorio muestra unicamente el total de los que ocupa todo su contenido. No de manera recursiva.

#### ejemplo

```sh
du -sh /*
```
Muestra en formato "humano" el total de lo que ocupan todos los elementos de la raíz del sistema.

```sh
du -sh * | sort -h #de menor a mayor
du -sh * | sort  #de mayor a menor
```
Simil anterior, pero ordena de menor a mayor por su tamaño.

### 14. Enlaces: LN

**Enlaces**

**ln**: Crea un enlace a un elemento del sistema de ficheros. Sin opciones creamos un enlace **hard** y con **-s** un enlace simbólico (o soft).
Un enlace **hard** es un puntero a la información de disco, mientras que uno **soft** apunta a la ruta (símil acceso director).

**A los directorios siempre se harán enlaces simbólicos**

#### ejemplo

Para un archivo.
```sh
ln /etc/apt/source.list ~/repos
```

Crea un enlace **hard** llamado repos que tendrá la misma información que el sources.list.

Para un directorio.
```sh
ln -s /var/cache/apt/archives/ /paquetes/
```
Crea un enlace simbolico llamado paquetes, que irá a /var/cache/apt/archives/

#### veamos algo importante.

Estoy en una carpeta que dentro de la misma hay un archivo llamado **miFichero**.


```sh
 ~/Escritorio/aBorrar ls -la
total 8
drwxrwxr-x 2 sucho sucho 4096 jul 21 15:46 .
drwxr-xr-x 8 sucho sucho 4096 jul 16 19:58 ..
-rw-rw-r-- 1 sucho sucho    0 jul 21 15:46 miFichero
```

```sh
ln miFichero miFichero2
ln miFichero miFichero3
```
Volvemos a listar la carpeta.

```sh
 ~/Escritorio/aBorrar ls -la
total 8
drwxrwxr-x 2 sucho sucho 4096 jul 21 15:48 .
drwxr-xr-x 8 sucho sucho 4096 jul 16 19:58 ..
-rw-rw-r-- 3 sucho sucho    0 jul 21 15:46 miFichero
-rw-rw-r-- 3 sucho sucho    0 jul 21 15:46 miFichero2
-rw-rw-r-- 3 sucho sucho    0 jul 21 15:46 miFichero3
```

En la columna siguiente hay un "3" asociado a **miFichero**. Esto quiere decir que tiene 2 link asociado a ese archivo.

Si modifico cualquiera de estos los otros también se verán afectados. Pero si borro alguno los otros permanecen aun si el que se borro fue la referencia de los otros dos.

#### ejemplo de link a carpeta.

```sh
ln -s miFichero2 miFichero_s
```
```sh
 ~/Escritorio/aBorrar ls -la
total 16
drwxrwxr-x 2 sucho sucho 4096 jul 21 16:04 .
drwxr-xr-x 8 sucho sucho 4096 jul 16 19:58 ..
-rw-rw-r-- 2 sucho sucho   21 jul 21 15:58 miFichero2
-rw-rw-r-- 2 sucho sucho   21 jul 21 15:58 miFichero3
lrwxrwxrwx 1 sucho sucho   10 jul 21 16:04 miFichero_s -> miFichero2
```
Se ve la diferencia entre link **soft** y **soft**, vemos que esta no suma en uno que tiene un enlace en **miFichero2**. 

¿Qué ocurre cuando borro la referencia a mi enlace **soft**?

```sh
 ~/Escritorio/aBorrar l 
total 12K
drwxrwxr-x 2 sucho sucho 4,0K jul 21 16:48 .
drwxr-xr-x 8 sucho sucho 4,0K jul 16 19:58 ..
-rw-rw-r-- 1 sucho sucho   21 jul 21 15:58 miFichero3
lrwxrwxrwx 1 sucho sucho   10 jul 21 16:48 miFichero_s -> miFichero2
 ~/Escritorio/aBorrar cat miFichero_s
cat: miFichero_s: No existe el archivo o el directorio
```
El link se corrompe, ya no funciona.
No es que ya no exista la información sino ya que **miFichero3** existe. Lo que ya no existe es **miFichero2**.

Veamos otro ejemplo

```sh
 ~/Escritorio/aBorrar ln -s /etc/ etc
etc  miFichero3  miFichero_s
 ~/Escritorio/aBorrar ls -la
total 12
drwxrwxr-x 2 sucho sucho 4096 jul 21 16:54 .
drwxr-xr-x 8 sucho sucho 4096 jul 16 19:58 ..
lrwxrwxrwx 1 sucho sucho    4 jul 21 16:54 etc -> /etc
-rw-rw-r-- 1 sucho sucho   21 jul 21 15:58 miFichero3
lrwxrwxrwx 1 sucho sucho   10 jul 21 16:48 miFichero_s -> miFichero2
```
¿Como se comporta el almacenamiento?

```sh
 ~/Escritorio/aBorrar ls -lah
total 51M
drwxrwxr-x 2 sucho sucho 4,0K jul 21 17:15 .
drwxr-xr-x 8 sucho sucho 4,0K jul 16 19:58 ..
-rw-rw-r-- 1 sucho sucho  50M jul 21 17:15 archivo
```
Vemos que nuestra carpeta pesa 51M, que pasa si le hacemos un link hard.

```sh
~/Escritorio/aBorrar ls -lah
total 101M
drwxrwxr-x 2 sucho sucho 4,0K jul 21 17:16 .
drwxr-xr-x 8 sucho sucho 4,0K jul 16 19:58 ..
-rw-rw-r-- 2 sucho sucho  50M jul 21 17:15 archivo
-rw-rw-r-- 2 sucho sucho  50M jul 21 17:15 archivo2
```

Vemos que nuestra carpeta ahora pesa el doble, pero es esto real? **NO**, nuestra **archivo2** es un referencia a **archivo**, por lo tanto para ver el peso real tendriamos que hacerlo de la siguiente manera.

```sh
 ~/Escritorio/aBorrar  du -sh .
51M	.
```