#!/bin/bash

# need for DWM in Void
sudo xbps-install -y xorg xinit make base-devel libX11-devel libXft-devel libXinerama-devel vim

sudo xbps-install -y freetype-devel fontcongig-devel

sudo xbps-install -y lxappearance

# Packages needed dwm after installation
sudo xbps-install -y numlockx dunst libnotify-bin policykit-1-gnome scrot 

sudo xbps-install -y firefox ranger nnn htop caffeine-ng nitrogen rofi wget picom

sudo xbps-install -y mousepad geany

# Install fonts
sudo xbpx-install -y fonts-font-awesome fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus

# EXA installation
# replace ls command in .bashrc file with line below
# alias ls='exa -al --long --header --color=always --group-directories-first' 
sudo xbpx-install -y exa



# XSessions and dwm.desktop
if [[ ! -d /usr/share/xsessions ]]; then
    sudo mkdir /usr/share/xsessions
fi

cat > ./temp << "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=dwm
Comment=Dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession
EOF
sudo cp ./temp /usr/share/xsessions/dwm.desktop;rm ./temp


# Creating directories
mkdir ~/.config/suckless


# Move install directory, make, and install
cd ~/.config/suckless
tools=( "dwm" "dmenu" "st" "slstatus" "slock" "tabbed" )
for tool in ${tools[@]}
do 
	git clone git://git.suckless.org/$tool
	cd ~/.config/suckless/$tool;make;sudo make clean install;cd ..
done





printf "\e[1;32mDone! you can now reboot.\e[0m\n"
