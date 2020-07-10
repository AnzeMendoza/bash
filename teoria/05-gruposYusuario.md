# grupos y usuarios

## información sobre grupos y usuarios

`sucho@ham` donde sucho puede ejecutar lo que quiera dentro de su directorio

Si quiero utilizar permisos de administrador.
Un usuario puede pertenecer un grupo principal pero puede tener muchos secundarios.

### comandos

- `whoami` : me dice que usuario soy yo.
- `groups` : me dice los grupos a los que pertenezco.
- `id` : me aparece todos los grupos en los cual aparece.

para saber que usuarios hay en el sistema

```sh
cat /etc/passwd
```
para saber los grupos

```sh
cat /etc/group
```
## Crear usuario, grupos, contraseñas y cambiar propietarios

para hacer todas las operacionés necesitamos ser ROOT 


```sh
adduser <nombreDeUsuarioNuevo>
```
como no le agrego grupo lo que hace es crearme un grupo con el mismo nombre que el usuario

```sh
addgroup <nombreDeGrupoNuevo>
```

```sh
usermod -g <nombreDelGrupoDestino> <nombreDelUsuario>
```

lo que haría es cambiar o agregarle un nuevo grupo a un usuario.

```sh
chown <usuarioDelArchivoDestino>:<nombreGrupo> <archivoQueQuieroCambiar>
```
Lo que hago es cambiar usuario y grupo al mismo tiempo de un archivo.

veamos ahora lo mismo pero de manera independiente

```sh
chown <usuarioDelArchivoDestino> <archivoQueQuieroCambiar>
```

Solamente me cambiaría de usuario, no de grupo.

```sh
chown :<nombreGrupo> <archivoQueQuieroCambiar>
```
Solamente me cambiaria de grupo y no de usuario.

```sh
passwd <usuarioPassAcambiar>
```
si solamente escribo la instrucción sin el usuario se interpreta que es el usuario actual.

## Los permisos en los ficheros

```sh
-rw-r--r-- 1 mono mona     0 jul  4 02:43 momo.txt
```

los guiones son las acciones prohibidas, `sudo apt install libreoffice`

| permiso usuario | permiso grupo | permiso del resto de usuarios
|:---:|:---:|:---:|
| drwx | rwx | rwx |

- r : read
- w : write
- x : execute

## Los permisos en los directorios

Cambia un poco a como se maneja los archivos.
- r : read (listar, ver los elementos de la carpeta)
- w : write ( escribir archivos y crearlos, no asi modificar el contenido de los archivos, ojo)
- x : execute (acceder, que yo pueda entrar a la carpeta)

## Cambiar permisos. Orden chmod

```sh
chmod <u|g|o>+<r|w|x> <nombreDelArchivo>
chmod <u|g|o>-<r|w|x> <nombreDelArchivo>
chdmod BBB <nombreDelArchivo>
```
- u: user
- g: group
- o: others
donde BBB, donde B es el valor en decimal [000,...,777] que se lo transforma para coincidir con rwx

ejemplo

```sh
chmod u+r, o-r archivo.c
```
si necesito mas acciones las separo con ",", ejemplo
```sh
chmod u+r, o-r archivo.c
```

```sh
chmod u=w, o=rx archivo.c
```
bien este ultimo lo que haría esta es agregarle solo para user, write pero le quita read y execute. Para others agregaría read, execute pero sacaría write.

```sh
chmod 000 archivo.c
```
Como al pasar a binario este quedaría en 000 000 000, lo que haría es sacarle todos los permisos a user, group, others

