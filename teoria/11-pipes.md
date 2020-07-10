## Las redirecciones: entrada, salida estándar y de errores.

Cuando un comando produce unos resultados en modo texto, los envía a la salida estándar del sistema, que de forma predeterminada es el monitor.

tanto: 

```sh
echo "Hola Mundo"
cat /etc/passwd
```

los dos comando interpretan que el flujo de información tiene que salir por pantalla.

Toda esa información puede por asi decirse "desviarme" mediante el uso de **>**

```sh
echo "Hola Mundo" > saludo.txt
```
Esto me genera un archivo, donde se guardara la información "Hola Mundo". Y no se muestra por el monitor.

- Usamos un solo **>** si el archivo existe, lo sobrescribe.
- Usamos dos **>>** si existe, lo agrega al final del archivo.

- Los mensajes de error se pueden redirigir de forma independiente usamos
    - **2>**
    - **2>>**
- Para redirigir todos los mensajes se usa **&>** o **&>>**.

## Conectando comandos: Las Tuberías.

- Salida Estandar: Monitor
- Redireccion:  archivos
- Tubería: que sea entrada de  otros procesos.  

Además de enviar texto a un dispositivo, disponemos de otra potente opción: enviarlo a otro comando. Esto se realiza con el carácter **|**.

REcibe el nombre de pipe, ya que establece un "canal" por el que pasará el texto de un comando a otro.

```sh
echo "Hola Mundo" | wc
```
imprime la cantidad de lineas, palabras y letras.

```sh
grep -w ana /etc/passwd | cut -d":" -f1 | sort
```
Busca ana en el archivo passwd, separa con el delimitador ":" y se queda con el primer campo, luego lo ordena.

¿Cuál es la carpeta que mas espacio ocupa en mi sistema?

```sh
du -sh /* 2> /dev/null | sort -h | tail -n1
```

Me muestra el directorio que mas ocupa en mi sistema.

También puedo redirigir la entrada de texto, para ello usamos el carácter **<**, que enviará la información que lee de un fichero al comando.

```sh
sort < listado
```
que ordene y va a agarrar las palabras que están en listado. Tener en cuenta que tiene que estar separado por nuevas lineas.

Si queremos desechar alguna salida, podemos usar el dispositivo **/dev/null**. Enviar texto hará que no aparezca ni se guarde en ningún sitio.

Podemos combinar todo lo estudiado en este tema

```sh
wc /etc/a* 2> /dev/null | sort -n > cont
```
