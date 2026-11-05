#!/bin/bash

# 1. Generar la clave SSH
ssh-keygen -t ed25519 -N "" -f ~/.ssh/id_ed25519

# 2. Configurar resoluciones en /etc/hosts
echo "192.168.56.5 pc-ubuntu" | sudo tee -a /etc/hosts
echo "192.168.56.6 pc-fedora" | sudo tee -a /etc/hosts

# 3. Copiar la clave propia a la carpeta compartida
cp ~/.ssh/id_ed25519.pub "/home/vagrant/compartido/pub_$(hostname).pub"

# 4. unificar claves en autorized_keys
cat /home/vagrant/compartido/pub_*.pub > ~/.ssh/authorized_keys

# 5. Ajustar permisos de SSH
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub

