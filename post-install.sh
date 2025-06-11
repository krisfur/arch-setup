#!/bin/bash

set -e

USER=kfurman
HOME_DIR="/home/$USER"

echo "[*] Updating system packages..."
pacman -Syu --noconfirm

echo "[*] Installing yay..."
cd /opt
git clone https://aur.archlinux.org/yay.git
chown -R $USER:$USER yay
cd yay
sudo -u $USER makepkg -si --noconfirm

echo "[*] Installing essential packages..."
pacman -S --noconfirm kitty gparted git neovim python-pip gcc cmake make tmux \
  zeromq zmqpp alsa-lib systemd go nodejs fastfetch gimp xournalpp

echo "[*] Installing AUR packages with yay..."
sudo -u $USER yay -S --noconfirm google-chrome visual-studio-code-bin discord steam \
  lazyvim github-cli asusctl supergfxctl asusctl-rog-gui

echo "[*] Setting up editor..."
echo "export EDITOR=/usr/bin/nvim" >>/etc/profile

echo "[*] Setting up fastfetch in .bashrc..."
echo "fastfetch" >>"$HOME_DIR/.bashrc"

echo "[*] Installing Rust..."
sudo -u $USER curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

echo "[*] Cloning LazyVim..."
sudo -u $USER git clone https://github.com/LazyVim/starter "$HOME_DIR/.config/nvim"
rm -rf "$HOME_DIR/.config/nvim/.git"

echo "[*] Setting up Catppuccin GRUB theme..."
git clone https://github.com/catppuccin/grub.git /tmp/grub
mkdir -p /usr/share/grub/themes
cp -r /tmp/grub/src/catppuccin-mocha-grub-theme /usr/share/grub/themes/
sed -i 's|^#GRUB_TERMINAL_OUTPUT=.*|# GRUB_TERMINAL_OUTPUT="console"|' /etc/default/grub
echo 'GRUB_THEME="/usr/share/grub/themes/catppuccin-mocha-grub-theme/theme.txt"' >>/etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

echo "[*] Setting up NVIDIA drivers..."
pacman -S --noconfirm nvidia nvidia-utils nvidia-settings nvidia-prime
echo "nvidia nvidia_modeset nvidia_uvm nvidia_drm" >>/etc/mkinitcpio.conf
mkinitcpio -P
bootctl update || grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable nvidia-hibernate.service nvidia-suspend.service nvidia-resume.service nvidia-powerd.service

echo "[*] Setting up ASUS drivers..."
systemctl enable supergfxd.service

echo "[✔] Post-install complete! Reboot recommended."
