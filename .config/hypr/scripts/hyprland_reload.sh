if [ -f /tmp/hyprstart.lock ]; then
    rm /tmp/hyprstart.lock
    exit 0
fi

# get wallpaper path
wall="$HOME/.config/Wallpapers/"$(wpg -c)

# Update Wallpaper
finalwall="$wall"

filter="Nearest"

if [[ "$wall" != *"gif" ]]; then
    filter="Lanczos3"
fi

# Update wallpaper image on rofi and sdddm
rm -f "$HOME"/.config/Wallpapers/current.png
magick "$wall"[0] -quality 40 -scale 1920x1080 "$HOME"/.config/Wallpapers/current.png
magick "$HOME"/.config/Wallpapers/current.png -gravity center -crop 1366x1080+128+0 +repage "$HOME"/.config/rofi/bg.png

# Update theme
sleep 1 && "$HOME"/.config/hypr/scripts/import-gsettings.sh

#update the sddm theme in the dumbest way cause syslinks stopped working for whatever reason
sudo cp -f "$HOME"/.config/Wallpapers/current.png "/usr/share/sddm/themes/corners/backgrounds/wallpaper.png"
cp -f "$HOME"/.config/sddm/theme.conf "$HOME"/.config/sddm/theme2.conf
echo BgSource="backgrounds/wallpaper.png" >>"$HOME"/.config/sddm/theme2.conf
sudo cp -f "$HOME"/.config/sddm/theme2.conf "/usr/share/sddm/themes/corners/theme.conf"
