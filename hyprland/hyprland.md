# Hyprland specific things:

1. Copy config to ~/.config/hypr/hyprland.conf

> Needs `kitty`, `dolphin`, and `waybar` (from `pacman`), and `google-chrome` (from `yay`)!

2. Install waybar and requirements:

`pacman`

```
sudo pacman -S \
  waybar \
  networkmanager \
  network-manager-applet \
  gsimplecal \
  brightnessctl \
  playerctl \
  noto-fonts \
  ttf-font-awesome \
```

`yay`

```
yay -S nerd-fonts-jetbrains-mono
yay -S wlogout
```

3. Copy `/waybar/` to `/etc/xdg/waybar/`.
