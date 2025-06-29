# Hyprland specific things:

1. Install `hyprland` requirements:

`pacman`

```bash
sudo pacman -S \ 
  kitty \
  dolphin \
  hyprpaper \
  waybar
```

`yay`

```bash
yay -S google-chrome
```

2. Copy `hyprland.conf` and `hyprpaper.conf` to ``~/.config/hypr/`

3. Install waybar and requirements:

`pacman`

```bash
sudo pacman -S \
  networkmanager \
  network-manager-applet \
  gsimplecal \
  brightnessctl \
  playerctl \
  noto-fonts \
  ttf-font-awesome \
```

`yay`

```bash
yay -S nerd-fonts-jetbrains-mono \
  wlogout
```

4. Copy `/waybar/` to `/etc/xdg/waybar/`.
