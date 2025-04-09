#!/bin/bash

# Mostrar el PID para poder enviarle señales fácilmente
echo "Mi PID es $$"

# Capturar la señal USR1
trap 'echo "esperando operando"' USR1

# Pedimos el número
echo -n "Introduce un número: "
read VAR

# Mostramos el resultado multiplicado por 7
echo "El número multiplicado por 7 es: $[VAR * 7]"

# Mantenemos el script vivo para que puedas enviar señales
while true; do
    sleep 1
done
-
