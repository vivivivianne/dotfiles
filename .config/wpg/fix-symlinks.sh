#!/bin/bash

ln -vfs $HOME/.config/spicetify/Themes/Comfy/Comfy/color.ini  $XDG_CONFIG_HOME/wpg/templates/Comfy_Comfy_color.ini 
ln -vfs $HOME/.config/cava/config  $XDG_CONFIG_HOME/wpg/templates/config_cava_config 
ln -vfs $HOME/.config/hypr/style.conf  $XDG_CONFIG_HOME/wpg/templates/config_hypr_style.conf 
ln -vfs $HOME/.config/kitty/kitty.conf  $XDG_CONFIG_HOME/wpg/templates/config_kitty_kitty.conf 
ln -vfs $HOME/.config/sddm/theme.conf  $XDG_CONFIG_HOME/wpg/templates/config_sddm_theme.conf 
ln -vfs $HOME/.config/swaync/config.json  $XDG_CONFIG_HOME/wpg/templates/config_swaync_config.json 
ln -vfs $HOME/.config/waybar/config  $XDG_CONFIG_HOME/wpg/templates/config_waybar_config 
ln -vfs $HOME/.config/zathura/zathurarc  $XDG_CONFIG_HOME/wpg/templates/config_zathura_zathurarc 
ln -vfs $HOME/.local/share/themes/FlatColor2/gtk-2.0/gtkrc  $XDG_CONFIG_HOME/wpg/templates/FlatColor2_gtk-2.0_gtkrc 
ln -vfs $HOME/.config/hypr/scripts/swaylock.sh  $XDG_CONFIG_HOME/wpg/templates/hypr_scripts_swaylock.sh 
ln -vfs $HOME/.config/rofi/powermenu/powermenu.rasi  $XDG_CONFIG_HOME/wpg/templates/rofi_powermenu_powermenu.rasi 
ln -vfs $HOME/.config/qt5ct/colors/wpgtk.conf  $XDG_CONFIG_HOME/wpg/templates/qt5ct_colors_wpgtk.conf 
ln -vfs $HOME/.config/qt6ct/colors/wpgtk.conf  $XDG_CONFIG_HOME/wpg/templates/qt6ct_colors_wpgtk.conf 
ln -vfs $HOME/.config/spicetify/Themes/Comfy/color.ini  $XDG_CONFIG_HOME/wpg/templates/Themes_Comfy_color.ini 
ln -vfs $HOME/.config/kdeglobals  $XDG_CONFIG_HOME/wpg/templates/vvn_config_kdeglobals 
ln -vfs $HOME/.config/rofi/style-1.rasi  $XDG_CONFIG_HOME/wpg/templates/config_rofi_style-1.rasi 

ln -vfs $HOME/.config/swaync/style.css $XDG_CONFIG_HOME/wpg/templates/config_swaync_style.css
ln -vfs $HOME/.config/waybar/style.css $XDG_CONFIG_HOME/wpg/templates/config_waybar_style.css
ln -vfs $HOME/.local/share/themes/FlatColor2/gtk-3.0/gtk.css $XDG_CONFIG_HOME/wpg/templates/FlatColor2_gtk-3.0_gtk.css
ln -vfs $HOME/.local/share/themes/FlatColor2/gtk-3.20/gtk.css $XDG_CONFIG_HOME/wpg/templates/FlatColor2_gtk-3.20_gtk.css
ln -vfs $HOME/.config/nvim/lua/bnnuy/colorscheme.lua $XDG_CONFIG_HOME/wpg/templates/lua_bnnuy_colorscheme.lua
ln -vfs $HOME/SYNC/obsidian/obsidian/.obsidian/snippets/obsidian.css $XDG_CONFIG_HOME/wpg/templates/obsidian_snippets_obsidian.css
ln -vfs $HOME/.config/kdeglobals $XDG_CONFIG_HOME/wpg/templates/traveler_config_kdeglobals
ln -vfs $HOME/.config/vesktop/themes/ClearVision-v7-Vencord.css $XDG_CONFIG_HOME/wpg/templates/vesktop_themes_ClearVision-v7-Vencord.css 
ln -vfs $HOME/.config/hypr/hyprlock.conf $XDG_CONFIG_HOME/wpg/templates/config_hypr_hyprlock.conf
ln -vfs $HOME/.config/hypr/scripts/nwg-menu.sh $XDG_CONFIG_HOME/wpg/templates/hypr_scripts_nwg-menu.sh

chmod +x $HOME/.local/share/icons/flattrcolor/scripts/*.sh
chmod +x $HOME/.config/hypr/scripts/*.sh
