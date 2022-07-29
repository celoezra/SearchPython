#!/usr/bin/env bash
#Celoezra Designer#
# ----------------------------- VARIÁVEIS ----------------------------- #

DIRETORIO_DOWNLOADS="/home/celoezra/Downloads/DIRETORIO_DOWNLOADS"

PROGRAMAS_PARA_INSTALAR=(
  snapd
  vlc
  virt-manager
  qbittorrent
  conky-all
  audacious
)
# ---------------------------------------------------------------------- #

# ----------------------------- REQUISITOS ----------------------------- #


## BORA REMOVER TRAVAS DO APT ##
sudo rm -rf /var/lib/apt/lists/lock
sudo rm /var/lib/dpkg/lock
sudo rm /var/cache/apt/archives/lock
sudo apt update
sudo dpkg --configure -a
sudo apt -f install
sudo rm /var/lib/dpkg/lock-frontend
sudo dpkg --configure -a
sudo apt update
## Adicionando/Confirmando arquitetura de 32 bits ##
sudo dpkg --add-architecture i386

## Atualizando o repositório ##
sudo apt update -y

# ----------------------------- EXECUÇÃO ----------------------------- #
## Atualizando o repositório depois da adição de novos repositórios ##
sudo apt update -y

## Download e instalaçao de programas externos ##
mkdir "/home/celoezra/Downloads/DIRETORIO_DOWNLOADS"
cd  "/home/celoezra/Downloads/DIRETORIO_DOWNLOADS"
wget -c "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"      -P "/home/celoezra/Downloads/DIRETORIO_DOWNLOADS"


## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg -i /home/celoezra/Downloads/DIRETORIO_DOWNLOADS/*.deb

# Instalar programas no apt
for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; do
  if ! dpkg -l | grep -q $nome_do_programa; then # Só instala se já não estiver instalado
    apt install "$nome_do_programa" -y
  else    
    echo "[INSTALADO] - $nome_do_programa"
  fi
done

## Instalando pacotes Flatpak ##


## Instalando pacotes Snap ##
sudo snap install photogimp
sudo snap install --classic code
sudo snap install discord 
# ---------------------------------------------------------------------- #

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y
# ---------------------------------------------------------------------- #
