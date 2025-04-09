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



