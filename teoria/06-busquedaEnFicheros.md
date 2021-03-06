## Comando find: introducción

Busca de forma recursiva en un directorio todos los fichero que cumplan ciertas condiciones.

```sh
find <path> <opciones>
```

### opciones

- **-name** "expresion" permite especificar patrones para los nombres de los ficheros a buscar. Diferencia entre mayúsculas y minúsculas, si queremos que no lo hagan pondremos **-iname**

- **-type <tipo>** : permite acotar el tipo de fichero a buscar.
    - **d** para **directorios**
    - **f** para **ficheros** regulares 
    - **l** para **enlaces** simbólicos 
    - **b** para **dispositivos** de bloque
    - **c** para **dispositivos** de carácter 
    - **p** para **tuberías** 
    - **s** para **sockets**.

#### ejemplos

```sh
find . -iname '*.mp3'
```

Esto lo que haría es buscar en el directorio donde me encuentro todos los archivos que sean mp3. Lo que me mostraría esto son los path de donde encuentre coincidencia.

```sh
find . -iname '*i*.mp3'
```

Símil al anterior pero en el nombre debe contener una 'i'.

```sh
find . -iname '*i*'
```

No solamente me devolvería paths de archivos sino también de carpetas.

```sh
find . -iname '*i*' -type d
```

Me devolvería solo los paths de las carpetas.

```sh
find . -iname '*i*' -type f
```

Me devolvería solo los paths de archivos.

### Opciones

- **-size** +/- <n> : permite indicar el tamaño máximo y/o mínimo de los ficheros a buscar.
    - Por defecto el tamaño se expresa en bloques de 512 bytes, pero se puede especificar las magnitudes por un carácter: 
        - **c** se refiere a **bytes** 
        - **k** a **kilobytes**
        - **M** a **Megabytes**
        - **G** a **Gigabytes**

#### ejemplos

```sh
find  -size <+|-><tamanio>
```
Miremos bien que lo le especifique el lugar donde lo empiece a buscar por ende es el directorio actual.

```sh
find  -size +200
find  -size -2M
```

## Comando Find: búsquedas por permisos, usuarios o grupos

### opciones:

- **-perm** +/-<modo> permite referirse a aquellos ficheros cuyos permisos sean los expresados exactamente modo (expresados en número), incluya todos los de modo (signo -) o incluya alguno de los de <modo> (signo /).

#### ejemplos

```sh
find  -perm +600 
```

Lo que me mostraría es en usuario quien tenga **rw-**, solamente los que cumplan esas dos condiciones.

```sh
find  -perm -600 
```
lo que muestra es todos los archivos o directorios que tengan esos dos independientemente de los permisos de grupo y otros.

```sh
find  -perm /600 
```

Opcionalmente se puede cumplir la **r** o la **w** en los permisos de usuario.

- **-user** <nombreUsuario> especifica el usuario propietario del fichero.


- **-group** <nombreGrupo> especifica el grupo propietario del fichero.

#### ejemplos

```sh
find -user profesor
find -group alumnos
```

```sh
find . -type f -user profesor -perm /200
```

Busco archivos del usuario profesor que como mínimo tenga permisos de **w**


```sh
find . -type l 
```
Me mostraría todos los enlaces que hay en el directorio .


```sh
find -perm /002 -type d
```
Buscame los directorios que tienen permiso de escritura para todos los usuarios. Esto los podría modificar cualquier usuario del sistema.

## Comando Find: fecha de modificación y profundidad máxima

- **-mmin [+/-]n** : Los datos del dichero fueron modificados por última vez hace **n** minutos.

- **-mtime [+/-]n** : Los datos del dichero fueron modificados por última vez hace **n*24hs** horas.


#### ejemplos

```sh
find . -mmin 30
find . -mmin -30
find . -mmin +30
```

el primero  son 30 minuto exactos, el segundo menos de 30 minutos y el tercero mas de 30 minutos.

```sh
find . -mtime 1
find . -mtime +1
find . -mtime -1
```

el primero en un dia exacto, el segundo en mas de un dia, el tercero en menos de un dia.

Como sabemos que el comando **find** trabaja de manera recursiva y no queremos que haga esto.

- **-maxdepth [niveles]** Desciende como muchos niveles (un entero no negativo) de directorios por debajo de los argumentos de la linea órdenes.

```sh
find . -maxdepth 2 -iname '*a*'
```

siempre se lo tiene que poner en primer lugar, después hago la búsqueda normal, lo que hace es buscar de manera recursiva solamente en dos niveles.


## Comando Find: opción exec, ejecuta un comando a los elementos encontrados.

- **-exe [comando]** : permite definir un comando a ejecutarse para cada resultado de la búsqueda. La cadena **{}** se sustituye por el nombre de los ficheros encontrados. El carácter **;**  permite indicar la finalización del comando (tanto **{}** como **;** tienen qu ir entre comillas o entre contra barras para evitar que sea sustituido por el shell)

#### ejemplos

```sh
find /etc/ -iname '*.conf' -size -1M -exec cp '{}' /home/copias/ ';'
```

Copia todos los ficheros con extensión .conf que sean menores de un MB al directorio /home/copias/

```sh
find ~ -size +2G -exec rm '{}' ';'
```

Borra de mi directorio personal todos los ficheros de más de 2 GB


```sh
find ~ -size +2G -exec rm '{}' ';'
```