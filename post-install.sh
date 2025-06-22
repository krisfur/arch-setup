#!/bin/bash

# Updating system packages
sudo pacman -Syu --noconfirm

# Installing yay
cd /opt
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R kfurman:kfurman yay
cd yay
sudo makepkg -si --noconfirm

# Installing essential packages
sudo pacman -S --noconfirm kitty gparted git neovim python-pip gcc cmake make tmux \
  zeromq npm alsa-lib systemd go nodejs fastfetch gimp xournalpp

# Installing AUR packages with yay
yay -S --noconfirm google-chrome visual-studio-code-bin discord steam \
  lazyvim github-cli zmqpp cursor-bin asusctl supergfxctl asusctl-rog-gui

# Setting up editor
sudo nvim /etc/profile
#add: export EDITOR=/usr/bin/nvim

# Setting up fastfetch in .bashrc
sudo nvim "/home/kfurman/.bashrc"
#add: fastfetch

# Installing Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Cloning LazyVim
sudo git clone https://github.com/LazyVim/starter "/home/kfurman/.config/nvim"
sudo rm -rf "/home/kfurman/.config/nvim/.git"

# Setting up Catppuccin GRUB theme
git clone https://github.com/catppuccin/grub.git /tmp/grub
sudo mkdir -p /usr/share/grub/themes
sudo cp -r /tmp/grub/src/catppuccin-mocha-grub-theme /usr/share/grub/themes/
sudo sed -i 's|^#GRUB_TERMINAL_OUTPUT=.*|# GRUB_TERMINAL_OUTPUT="console"|' /etc/default/grub
sudo nvim /etc/default/grub
#add: GRUB_THEME="/usr/share/grub/themes/catppuccin-mocha-grub-theme/theme.txt"
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Installing Docker
sudo pacman -S --noconfirm docker
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -aG docker kfurman

# Setting up NVIDIA drivers
sudo pacman -S --noconfirm nvidia nvidia-utils nvidia-settings nvidia-prime
sudo nvim /etc/mkinitcpio.conf
#add: MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
sudo mkinitcpio -P
sudo bootctl update
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo systemctl enable nvidia-hibernate.service nvidia-suspend.service nvidia-resume.service nvidia-powerd.service

# Setting up ASUS drivers
sudo systemctl enable supergfxd.service

# [✔] Post-install complete! Reboot recommended.
