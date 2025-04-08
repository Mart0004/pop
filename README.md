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


