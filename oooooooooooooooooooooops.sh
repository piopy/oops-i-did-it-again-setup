#!/bin/bash

set -e

PYTHON_VERSION="3.10"

# Aggiorna il sistema
sudo apt update && sudo apt upgrade -y

# Installa dipendenze di base
sudo apt install -y wget curl apt-transport-https ca-certificates software-properties-common

# Installazione di Utilità di Rete
sudo apt install -y net-tools iproute2 nmap

# Installazione di Snapd
sudo apt install -y snapd

# Installazione di Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install -y

# Installazione di Spotify
sudo snap install spotify

# Installazione di VSCode
sudo snap install code --classic

# Installazione di DBeaver (tramite Snap)
sudo snap install dbeaver-ce

# Aggiungi il PPA di Deadsnakes se non già presente (necessario per molte versioni specifiche)
if ! grep -q "ppa:deadsnakes/ppa" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
  echo "Aggiungo il PPA deadsnakes per versioni specifiche di Python..."
  sudo add-apt-repository ppa:deadsnakes/ppa -y
  sudo apt update
fi

# Installazione della versione specifica di Python
echo "Installazione di Python ${PYTHON_VERSION}..."
sudo apt install -y python${PYTHON_VERSION} python${PYTHON_VERSION}-venv

# Rimozione di pip perchè è meglio usare poetry nei progetti
sudo apt remove --purge python3-pip -y
sudo apt autoremove -y

# Installazione di Git
sudo apt install -y git

# Installazione di Postman (Snap)
sudo snap install postman

# Installazione di Poetry, Black
echo "Installazione di Poetry..."
curl -sSL https://install.python-poetry.org | python3 - 
if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
  export PATH="$HOME/.local/bin:$PATH"
fi
poetry config virtualenvs.in-project true

# Installazione di htop e Transmission
sudo apt install -y htop transmission

# Installazione di Docker e Docker Compose
sudo apt install -y docker.io
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-compose-plugin
sudo usermod -aG docker $USER

# Installazione di WireGuard
sudo apt install -y wireguard

# Installazione di Terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install -y terraform

# Aggiunta alias in bashrc
echo "alias vsc='code . && exit'" >> ~/.bashrc
# Verifica delle installazioni
echo "Verifica l'installazione di Docker con: docker --version"
docker --version 
echo "Verifica l'installazione di Docker Compose con: docker-compose --version"
docker-compose --version 
echo "Verifica l'installazione di Poetry con: poetry --version"
poetry --version 
echo "Verifica l'installazione di WireGuard con: wg --version"
wg --version 
echo "Verifica l'installazione di Python con: python${PYTHON_VERSION} --version"
python${PYTHON_VERSION} --version 
echo "Verifica l'installazione di htop con: htop --version"
htop --version 
echo "Verifica l'installazione di nmap con: nmap --version"
nmap --version 
echo "Verifica l'installazione di DBeaver con: snap info dbeaver-ce" 
snap info dbeaver-ce 
echo "Verifica l'installazione di Spotify con: snap info spotify" 
snap info spotify 
echo "Verifica l'installazione di VSCode con: snap info code" 
snap info code 
echo "Verifica l'installazione di Terraform con: terraform --version"
terraform --version

# Sezione per l'installazione delle estensioni di VSCode
code --install-extension GitHub.copilot
code --install-extension HashiCorp.terraform
code --install-extension ms-azuretools.vscode-docker
code --install-extension Gruntfuggly.todo-tree
code --install-extension mechatroner.rainbow-csv
code --install-extension MS-vsliveshare.vsliveshare
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension Shinotatwu-DS.file-tree-generator
code --install-extension ms-python.black-formatter

echo "Fatto!"

