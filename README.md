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

Hem de guardar el script, pel que fem un _ctrl + O_, després executem, amb _Enter_, i per últim fem _ctrl + X_ per sortir del nano.
Darrerament, hem de donarli permissos i executar: 
```bash
chmod +x multiplicar.sh

./multiplicar.sh
```
