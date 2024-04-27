#! /bin/bash

echo "Inicializando Xuxian Script..." 
echo "execute esse script como root"
sleep 5
echo "\n"

#Criando links de binarios para /usr/bin
links(){
 ln /usr/sbin/fsck*  	/usr/bin
 ln /usr/sbin/mk*  	/usr/bin
 ln /usr/sbin/e2*    	/usr/bin
 ln /usr/sbin/fdisk  	/usr/bin
 ln /usr/sbin/user*  	/usr/bin
 ln /usr/sbin/group* 	/usr/bin
 ln /usr/sbin/grub*  	/usr/bin
 ln /usr/sbin/update*   /usr/bin
 ln /usr/sbin/swap*	/usr/bin
 ln /usr/sbin/reboot 	/usr/bin
 ln /usr/sbin/shutdown 	/usr/bin
 ln /usr/sbin/add* 	/usr/bin
 ln /usr/sbin/new*	/usr/bin
 ln /usr/sbin/remove*	/usr/bin
 ln /usr/sbin/cfdisk 	/usr/bin
 ln /usr/sbin/poweroff  /usr/bin
}
links
#Adicionando usuario ao grupo sudo
addSudo(){
	echo "Adicionando usuario ao grupo sudo"
	usermod -aG sudo $USER
	newgrp sudo
}
addSudo

#Adicionadno repositorio contrib e non-free no debian
addRepo(){
	echo "Adicionando repositorios contrib e non-free"
	sudo apt install software-properties-common
	sudo add-apt-repository deb http://ftp.debian.org/debian stable main contrib non-free
}
addRepo

#instalndo pacotes 
pacotesBasicos(){
	echo "Instalando pacotes basicos"
	sudo apt install neofetch curl openssh-server ufw gufw xinput flatpak network-manager network-manager-gnome git rofi htop gdebi make  -y
}
pacotesBasicos

pacotesNativos(){
	sudo apt install cheese chromium tuxmath drawing gimp keepassxc ttf-mscorefonts-installer deepin-icon-theme geany -y
	wget -c https://github.com/FreeTubeApp/FreeTube/releases/download/v0.20.0-beta/freetube_0.20.0_amd64.deb -P ~/Downloads/
	wget -c https://www.freeoffice.com/download.php?filename=https://www.softmaker.net/down/softmaker-freeoffice-2021_1068-01_amd64.deb -P ~/Downloads/
	dpkg -i /home/$USER/Downloads/*.deb
}
pacotesNativos

