#!/bin/bash 
pdir=$(dirname $(realpath $0))
phome=~/

printf "\n>Change directory to ~/\n\n"
cd $phome
printf "\n>Installing basic packages\n\n"
# Install basic packages
sudo pacman -Syu --noconfirm neovim bspwm sxhkd rxvt-unicode dmenu xorg xorg-xinit nitrogen firefox nautilus ranger screengrab zathura zathura-pdf-poppler amd-ucode xf86-video-amdgpu man-db man-pages python python-pip xsel mlocate alsa-utils alsa-firmware pulseaudio pulseaudio-alsa pulseaudio-jack pulsemixer
pip install neovim

# Install yay
printf "\n>Make directory aur/ .trash/\n\n"
mkdir $phome/aur $phome/.trash
cd $phome/aur
printf "\n>Install AUR package-manager yay from aur/\n\n"
git clone https://aur.archlinux.org/yay.git
cd $phome/aur/yay/
makepkg -si --noconfirm
cd $phome

# Install polybar
printf "\n>Using yay to install polybar\n\n"
yay -S --noconfirm siji ttf-unifont polybar

# Copy configurations
printf "\n>Change directory to ~/git/OS-configs\n\n"
cd $pdir
printf "\n>Copying all config files\n\n"
cp -r .colors/ $phome
cp -r .config/ $phome
cp .gitconfig $phome
cp -r scripts/ $phome
cp .xinitrc $phome
cp .Xresources $phome
cp .bashrc $phome

printf "\n>Installation is over!\n"
