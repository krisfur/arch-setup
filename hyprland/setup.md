# Hyprland specific things:

1. Place wallpaper (i.e. `aqua.png`) in `~/Pictures/`.

2. Install `hyprland` requirements:

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

3. Copy `hyprland.conf` and `hyprpaper.conf` to `~/.config/hypr/`.

4. Install `waybar` requirements:

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

5. Copy `/waybar/` to `/etc/xdg/waybar/`.
