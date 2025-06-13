if [ -f /tmp/hyprstart.lock ]; then
	rm /tmp/hyprstart.lock
	exit 0
fi

# get wallpaper path
wall="$HOME/.config/Wallpapers/"$(wpg -c)

finalwall="$wall"

magick "$wall"[0] -quality 40 -scale 1920x1080 "$HOME"/.config/Wallpapers/current.png
magick "$HOME"/.config/Wallpapers/current.png -gravity center -crop 1366x1080+128+0 +repage "$HOME"/.config/rofi/bg.png

filter="Nearest"

if [[ "$wall" != *"gif" ]]; then
	filter="Lanczos3"
fi

# Update Wallpaper
swww img -f $filter --transition-type any --transition-duration 2 --transition-fps 60 "$finalwall"

## Reload Hyprland Plugins
hyprpm reload

# Update theme
"$HOME"/.config/hypr/scripts/import-gsettings.sh
pywalfox update

# update swaync
swaync-client -R &
swaync-client -rs &

# update waybar
killall -q waybar

# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 0.5; done

## Relaunch Waybar
waybar &
disown

#update sddm

#update the sddm theme in the dumbest way cause syslinks stopped working for whatever reason
sudo cp -f "$HOME"/.config/Wallpapers/current.png "/usr/share/sddm/themes/corners/backgrounds/wallpaper.png"
cp -f "$HOME"/.config/sddm/theme.conf "$HOME"/.config/sddm/theme2.conf
echo BgSource="backgrounds/wallpaper.png" >> "$HOME"/.config/sddm/theme2.conf
sudo cp -f "$HOME"/.config/sddm/theme2.conf "/usr/share/sddm/themes/corners/theme.conf"

## Relaunch keepassxc
killall -q keepassxc 

# Wait until the processes have been shut down
while pgrep -x keepassxc >/dev/null; do sleep 0.5; done

## Relaunch Keepass 
keepass &
disown

