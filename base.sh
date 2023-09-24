#!/bin/sh
sudo apt install nala -y

sudo nala install network-manager avahi -y
sudo systemctl enable NetworkManager
sudo systectl enable avahi-daemon

sudo nala install gvfs gvfs-backends

sudo nala install pcmanfm xarchiver unzip

sudo nala install tlp tlp-rdw thermald -y
sudo systemctl enable tlp
sudo systemctl enable thermald

sudo nala install pulseaudio pavucontrol alsa-utils -y

sudo nala install xdg-desktop-portal-wlr xwayland libgtk-layer-shell-dev wl-clpboard xdg-utils -y

sudo nala install swayidle swaylock swaybg grim slurp jq dex rofi brightnessctl mako -y

xdg-user-dirs-update 

# Display Manager
sudo nala install libpam0g-dev libxcb-xkb-dev
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
make
sudo make install installsystemd
cd
sudo systemctl enable ly.service
