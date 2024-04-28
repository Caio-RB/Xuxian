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
	echo "Usuario adicionado ao grupo sudo!"
}
addSudo

#Adicionadno repositorio contrib e non-free no debian
addRepo(){
	echo "Adicionando repositorios contrib e non-free"
	sudo apt update
	sudo apt install software-properties-common
	sudo add-apt-repository deb http://ftp.debian.org/debian stable main contrib non-free
	sudo apt update
	clear
	echo "Repositórios adicionados"

}
addRepo

#instalndo pacotes 
pacotesBasicos(){
	echo "Instalando pacotes basicos"
	sudo apt install neofetch curl openssh-server ufw gufw xinput flatpak network-manager network-manager-gnome git rofi htop gdebi make  -y
	clear
	echo "Pacotes Basicos adicionados: neofetch curl openssh-server ufw gufw xinput flatpak network-manager network-manager-gnome git rofi htop gdebi make"
}
pacotesBasicos

pacotesNativos(){
	echo "Instalando fontes, icones e programas nativos(.deb)"
	sudo apt install cheese chromium tuxmath drawing gimp keepassxc ttf-mscorefonts-installer deepin-icon-theme geany klavaro alacarte -y
	wget -c https://github.com/FreeTubeApp/FreeTube/releases/download/v0.20.0-beta/freetube_0.20.0_amd64.deb -P /home/$USER/Downloads/
	wget -c https://www.freeoffice.com/download.php?filename=https://www.softmaker.net/down/softmaker-freeoffice-2021_1068-01_amd64.deb -P /home/$USER/Downloads/

	dpkg -i /home/$USER/Downloads/*.deb
	clear
	echo "Instalação completa"
}
pacotesNativos

pacotesFlatpak(){
	echo "Adicionando repositorio flathub"
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo  
	
	echo "Instalando pacotes flatpak"
	flatpak install com.snes9x.Snes9x -y 
	
	echo "Instalando loja de aplicativos(bauh)"
	mkdir -p .appimages/
	wget -c https://github.com/vinifmor/bauh/releases/download/0.10.7/bauh-0.10.7-x86_64.AppImage -P /home/$USER/.appimages/
	sudo chmod +x /home/$USER/.appimages/bauh-0.10.7-x86_64.AppImage
}
pacotesFlatpak

#Habilitando click com touch pad e definindo atalhos de teclado
touchpadTeclado(){
	echo "Habilitando clique do touchpad"
	cp ./xsessionrc /home/$USER/.xsessionrc
	echo "Definindo teclas de atalho"
	cp ./lxde-rc.xml /home/$USER/.config/openbox/
}
touchpadTeclado

#Desabilitando SSH
disableSsh(){
	echo "Desabilitando ssh na inicialização do sistema."
	sudo systemctl disable ssh
}
disableSsh
#Configurando Rofi
rofiConfig(){
	echo "Configurando menu(rofi)."
	cp ./rofi.tar.gz /home/$USER/.config/rofi/
	tar -xzf /home/$USER/.config/rofi/rofi.tar.gz
	rm /home/$USER/.config/rofi/rofi.tar.gz
}
rofiConfig

