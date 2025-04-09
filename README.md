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




