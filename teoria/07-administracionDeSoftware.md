## Paquetes y repositorios

Los repositorios son servidores encargado de proveernos los software a linux.

Necesito tener permisos de administrador.

```bat
vim /etc/apt/source.list
```
Aca estan las fuentes de paquetes a instalar, es donde se va a ir a buscar si es que queremos instalar algun software.

```bat
sudo apt-get update
```
descarga toda la lista de softwarea disponible de mis repositorios.

```bat
sudo apt-cache seach vlc
```

Ya que vamos a buscar en la lista actualizada que descargue con update.

```bat
sudo apt-get install vlc
```
instalo VLC

```bat
sudo apt-get remove vlc
```
desistalo VLC


```bat
sudo apt-get purge vlc
```
desistala y elimina todos los archivos de configuración VLC.



```bat
sudo aptitude search vlc
```
El primer carácter de cada línea indica el estado actual del paquete:

- i el paquete está instalado y todas sus dependencias están satisfechas.
- c el paquete fue eliminado, pero sus archivos de configuración todavía están presentes.
- p el paquete y todos sus archivos de configuración se eliminaron, o nunca fue instalado.
- v el paquete es virtual.
- B el paquete esta roto dependencias.
- u el paquete ha sido desempaquetado, pero no se ha configurado.
- C a medio configurar- La configuración falló y requiere ser reparada.
- H a medio configurar- Falló la eliminación y requiere ser reparada.

El segundo carácter indica la acción (si los hubiere), que se realizó sobre el paquete:

- i el paquete será instalado.
- u el paquete será actualizado.
- d el paquete será eliminado, pero sus archivos de configuración se mantendrán.
- p el paquete será purgado: el y sus archivos de configuración serán removidos.
- h el paquete será mantenido: se mantendrá su estado actual, aunque exista una versión más nueva.
- F una actualización del paquete ha sido prohibido.
- r el paquete será reinstalado.
- B el paquete será "roto": algunas de sus dependencias no serán satisfechas. En aptitude no le permitirá instalar, eliminar o actualizar mientras que usted tiene los paquetes rotos.

El tercer carácter de cada línea indica el estado actual del paquete:

- A ha sido instalado automáticamente, como dependencia de otro paquete que se ha pedido instalar.

## Administración con aptitude y Synaptic (entorno gráfico)

```bat
sudo aptitude 
```

Me abre una ventana interactiva. 
