#!/bin/bash

sudo xbpx-install -y tilix



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
