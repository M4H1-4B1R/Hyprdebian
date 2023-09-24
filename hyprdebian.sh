#!/bin/sh

# Install nala for better downloads
sudo apt install nala -y

# Dependencies
sudo nala install meson wget build-essential ninja-build cmake-extras cmake gettext gettext-base fontconfig libfontconfig-dev libffi-dev libxml2-dev libdrm-dev libxkbcommon-x11-dev libxkbregistry-dev libxkbcommon-dev libpixman-1-dev libudev-dev libseat-dev seatd libxcb-dri3-dev libvulkan-dev libvulkan-volk-dev  vulkan-validationlayers-dev libvkfft-dev libgulkan-dev libegl-dev libgles2 libegl1-mesa-dev glslang-tools libinput-bin libinput-dev libxcb-composite0-dev libavutil-dev libavcodec-dev libavformat-dev libxcb-ewmh2 libxcb-ewmh-dev libxcb-present-dev libxcb-icccm4-dev libxcb-render-util0-dev libxcb-res0-dev libxcb-xinput-dev libpango1.0-dev xdg-desktop-portal-wlr hwdata check libgtk-3-dev libsystemd-dev xwayland kitty edid-decode libgbm-dev -y

mkdir ~/hyprbuild
cd ~/hyprbuild

# Wayland build
wget https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.22.0/downloads/wayland-1.22.0.tar.xz
tar -xvJf wayland-1.22.0.tar.xz
cd wayland-1.22.0
mkdir build
cd build
meson setup --prefix=/usr --buildtype=release -documentation=false
ninja
sudo ninja install
cd ~/hyprbuild

# Wayland-protocols build
wget https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.32/downloads/wayland-protocols-1.32.tar.xz
tar -xvJf wayland-protocols-1.32.tar.xz
cd wayland-protocols-1.32
mkdir build
cd build
meson setup --prefix=/usr --buildtype=release
ninja
sudo ninja install
cd ~/hyprbuild

# libdisplay build
 wget https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/0.1.1/downloads/libdisplay-info-0.1.1.tar.xz
 tar -xvJf libdisplay-info-0.1.1.tar.xz
 cd libdisplay-info-0.1.1
 mkdir build
 cd build
 meson setup --prefix=/usr --buildtype=release
 ninja
 sudo ninja install
 cd ~/hyprbuild

# libliftoff build
 git clone https://gitlab.freedesktop.org/emersion/libliftoff.git
 cd libliftoff
 meson setup build
 ninja -C build
 cd build
 sudo ninja install
 cd ~/hyprbuild

# libinput build
 git clone https://gitlab.freedesktop.org/libinput/libinput.git
 cd libinput
 sudo ln -s /usr/include/locale.h /usr/include/xlocale.h
 meson setup --prefix=/usr build
 ninja -C build
 sudo ninja -C build install
 cd ~/hyprbuild

 # Hyprland build
wget https://github.com/hyprwm/Hyprland/releases/download/v0.28.0/source-v0.28.0.tar.gz
tar -xvf source-v0.28.0.tar.gz
cd hyprland-source/
sudo make install
cd ~/hyprbuild

sudo mkdir /usr/share/wayland-sessions
sudo cp ~/hyprbuild/hyprland-source/example/hyprland.desktop /usr/share/wayland-sessions/

# gBar
sudo nala install libgtk-layer-shell-dev libpulse-dev libdbusmenu-gtk3-dev
git clone https://github.com/scorpion-26/gBar --recursive
cd gBar
meson setup build
ninja -C build
sudo ninja -C build install
cd ~/hyprbuild


