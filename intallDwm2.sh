#!/bin/bash


sudo xbps-install -y lxappearnance

sudo xbps-install -y neofetch htop

sudo xbps-install -y exa

sudo xbps-install -y nitrogen fech

# Packages needed dwm after installation
sudo apt install -y picom numlockx rofi dunst libnotify-bin unzip policykit-1-gnome scrot mousepad

# Install fonts
sudo xbps-install fonts-font-awesome fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus 
sudo xbps-install -y tilix















printf "\e[1;32mDone! you can now reboot.\e[0m\n"
