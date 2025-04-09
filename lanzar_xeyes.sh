#!/bin/bash

# Lanzar xeyes en segundo plano con prioridad 18
nice -n 18 xeyes &

# Guardar el PID del último proceso lanzado en segundo plano
PID=$!

# Esperamos un segundo para asegurar que el proceso esté registrado
sleep 1

# Mostrar información del proceso xeyes
echo "Información del proceso xeyes lanzado:"
ps -p $PID -o pid,ni,cmd
