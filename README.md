# Practica 1 Fonaments de Xarxes Telemàtiques
## Exercici 2.2
### 1. 
Primer hem de crear un script executable amb un editor de text
```bash
nano multiplicar.sh
```
Acte seguit fiquem el codi a executar:

```bash
#!/bin/bash

echo -n "Introduce un número: "
read VAR
echo "El número multiplicado por 7 es: $[VAR * 7]"
```
![Screenshot at 2025-04-08 18-38-10](https://github.com/user-attachments/assets/cb287c27-6c63-46e3-9f45-2c90381526af)
Hem de guardar el script, pel que fem un _ctrl + O_, després executem, amb _Enter_, i per últim fem _ctrl + X_ per sortir del nano.
Darrerament, hem de donarli permissos i executar: 
```bash
chmod +x multiplicar.sh

./multiplicar.sh
```
![Screenshot at 2025-04-08 18-39-58](https://github.com/user-attachments/assets/a50a45d6-aa40-47f5-9568-175ff0c703a6)

### 2.
Ahora, debemos hacer que tras ejecutar el script, podamos pararlo con una señal y su PID
Creamos un nuevo script, parecido al original y lo modificamos para pararlo con el USR1:
``` bash
# Primero le pedimos que nos cree el .sh con el editor nano
nano multipl_signal.sh

# A continuacion introducimos el codigo del script

#!/bin/bash

# Mostramos el PID
echo "Mi PID es $$"

trap 'echo "esperando operando"' USR1

echo -n "Introduce un número: "
read VAR

echo "El número multiplicado por 7 es: $[VAR * 7]"

# Mantenemos el script abierto para poder ejecutar la señal USR1
while true; do
    sleep 1
done
```

Luego lo guardamos (ctrl + O, Enter) y le damos permisos, para poder ejecutarlo:

``` bash
chmod +x multipl_signal.sh
./multipl_signal.sh
```
Nos saldrà el PID, junto xcon la ejecucion del programa multiplicar, luego, se nos quedará esperando instrucciones.
Desde ptro terminal le deberemos pasar el comando:
```bash
kill -USR1 PID #(El que te salga en multipl_signal.sh)
```

![Screenshot at 2025-04-09 12-01-17](https://github.com/user-attachments/assets/e384795f-6bfe-41f6-9c38-e4a2f8ca2535)

### Exercise 3
El proceso del script de este ejercicio és muy similar al anterior:

Aquí esta el codigo del lanzar_xeyes.sh:

![xeyes](https://github.com/user-attachments/assets/99666fc7-4174-461b-bb08-aa12c8e8faf1)


A continuación lo ejecutamos:

![xeyes1](https://github.com/user-attachments/assets/e0ef4991-8ecb-45f4-a135-dfb605e654cf)


## Exercici 3.2
### 1
Cree un archivo llamado orig.txt con el comando touch y use el comando ln para crear un enlace simbólico a orig.txt llamado link.txt. Abra el editor de texto vi y modifique el archivo orig.txt introduciendo texto.
```bash
# Creamos un fichero con su 'enlace':

touch orig.txt

ln -s orig.txt link.txt

#Editamos el Orig.txt
vi orig.txt
```

![vi](https://github.com/user-attachments/assets/7811d740-4192-48c0-a32f-331d6a6743a3)

### 2

```bash
# Miramos si ha cambiado el contenido en los dos ficheros:
cat orig.txt
cat link.txt
```
Ha cambiado, porque el 'enlace' actúa como una especie de acceso directo, es decir, que es el orig.txt, pero con otro nombre.
![cat](https://github.com/user-attachments/assets/be9877a8-afff-4691-8b5a-f134bc11ea2f)


### 3
![p2](https://github.com/user-attachments/assets/4add7a11-446a-46ca-8366-0793461dd5d0)

Como se puede observar, tanto si cambias el link.txt, como si cambias el orig.txt, ambos actuan como si fueran uno solo, es decir, que es un 'acceso directo'.

![p3](https://github.com/user-attachments/assets/c5c1fe4b-a55d-4cfe-8ed3-cd5e0b6e446a)

### 4
Para eso le escribiremos este codigo 
```bash
chmod 000 orig.txt

```

![den](https://github.com/user-attachments/assets/2270ee25-7454-44d9-bd6b-c98ce8da8bfd)

Como se puede ver, no permitirá el acceso al archivo orig.txt desde link.txt, ya que este solo es un acceso directo, un puntero, visto de otra forma, así que si el orig.txt no tiene permisos, mucho menos el link.txt.


### 5
Según los resultados, vemos como el hecho de quetar los permisos al link.txt también afecta de el mismo modo al orig.txt.
Creo que esto sucede debido a que, como son el mismo enlace, el hecho de quitar uno, està quitando tambien permisos del otro.
![5](https://github.com/user-attachments/assets/580b7f53-e7b9-4e2a-b3b2-715ebc4fca80)


### 6 
Tras eliminar orig.txt el link.txt no logrará encontrar el directorio de donde sacaba la información anteriormente.

![dd](https://github.com/user-attachments/assets/1a3d7c02-192d-4671-a140-d33397de5b6a)

Sin embargo, si creamos de nuevo orig.txt, link.txt funcionará de nuevo:

![ll](https://github.com/user-attachments/assets/1b921fa9-8320-4386-a5ab-907a18f6a6fe)

Con el comando echo hello > link.txt sobreescribimos el contenido de kink.txt (orig.txt) y lo cambia por la línea 'hello'.
![ddd](https://github.com/user-attachments/assets/c9d4ed38-23b7-4042-897d-d26557631f6d)


### 7
En esta imagen se ve como orig.txt solo tiene un enlace, pero no se detalla sobre este. Sin embargo link.txt tiene 1 enlace en orig.txt
![stat](https://github.com/user-attachments/assets/235e985e-2f57-42f9-8387-e6609f9acf92)

### 8

Ahora, como uno apunta al otro, en este caso hard.txt y orig.txt tendrán 2 links cada uno:
![dsa](https://github.com/user-attachments/assets/63f40c4b-7bf8-45de-be6a-b432109a4067)
Se puede entender que el contenido de orig.txt, ya no está solo en orig.txt sino también está en hard, porque orig.txt apunta a hard.txt

### 9
Con lo que sabemos del 8, podemos entender que si eliminamos uno de los dos, por ejemplo orig.txt, todavía conservaremos el contenido, ya que apuntan ambos al mismo contenido.
![rm](https://github.com/user-attachments/assets/2080afed-d4ef-4994-8529-831e14b8be40)
![hardvi](https://github.com/user-attachments/assets/926fcb8d-cb9a-487c-a4a9-b84bd2dbd9e6)
Hard.txt sigue poseyendo la informacion, aunque orig.txt se haya eliminado.

### 10
Aquí está la informacion relevante de http
![http](https://github.com/user-attachments/assets/a871361d-38bc-48c0-8a49-4b85a4a32341)

### 11
Debería salir toda la información relevante sobre los grupos del sistema. Hay mucha información pero el campo de users, como se observa, está vacío, además de muchisimos grupos vacíos:
![1](https://github.com/user-attachments/assets/1f40b2a6-a61e-42c9-b024-664833bf784d)
![2](https://github.com/user-attachments/assets/8312830d-4c78-40b4-9d13-86f62e620652)
![3](https://github.com/user-attachments/assets/3e198037-ffd2-49f5-b559-ee3499cba30e)

### 12
El texto dentro del text1.txt es reconocido como texto UFT-8, debido a la ñ:

![text1](https://github.com/user-attachments/assets/9ecc94ea-3e65-4725-8702-cb7f0c0dc5af)

### 13
En el buscador, me sale que 'ñ' tiene una codificación:
    En ISO-8859-15: En esta codificación, la letra 'ñ' (minúscula) se representa con el valor hexadecimal ***F1***.
    En UTF-8: En UTF-8, la "ñ" se codifica en dos bytes: C3 B1. 
Con hexdump se ve que la codificación nos muestra: 

![ssd](https://github.com/user-attachments/assets/7229f9c5-d01a-48db-9a61-092086d58c06)

### 14
Según Internet, el carácter 0x0a hexadecimal, indica un salto de línea presente en los documentos de texto en los que hay saltos de línea,que aparecen al pulsar Enter. Necesario para saber Cuando termina la línea.

### 15
El resultado de text2.txt guardado en Gedit es:
```bash
00000000  61 62 c3 b1 0d 0a                                 |ab....|

```
El fin de línea en este texto es 0d 0a, donde el '0a' significa el final de la línea de texto, y '0d' es el salto de línea.

### 16
    Las diferencias según el sistema son:
    **Unix y macOS nuevo:**
    Usa solo LF (Line Feed) para marcar el final de una línea.
        Hexadecimal: 0x0A
        Representación: \n
    
    **Windows:**
    Usa una combinación de CR (Carriage Return) + LF (Line Feed) para marcar el final de una línea.
        Hexadecimal: 0x0D 0x0A
        Representación: \r\n
        
    **Mac clásico:**
    Usaba solo CR (Carriage Return) para el salto de línea.
        Hexadecimal: 0x0D
        Representación: \r

### 17
Tras crear el archivo vemos la codificación hexadecimal con el siguiente comando:
```bash
hexdump -C text3.txt
```
Como hemos visto antes, la codificación serà:
```bash
00000000  61 62 f1                                          |ab.|
00000003

```
Donde 61 = a, 62 = b (en ASCII) y f1 = ñ (en ISO-8859-15).
Eso significa que las diferentes codificaciones varían la representacion de los caracteres.


