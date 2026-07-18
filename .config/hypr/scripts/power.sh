#!/bin/bash

logout() {
    # killall waybar
    qs -c caelestia kill
    awww kill
    killall mpd
    killall Hyprland
}

lock() {
    playerctl pause && hyprlock && playerctl play
}

hibernate() {
    suspend
}

suspend() {
    lock &
    sleep 1 && sudo systemctl suspend
}

shutdown() {
    qs -c caelestia kill
    awww kill
    killall mpd
    killall Hyprland
    sleep 1 && systemctl poweroff
}

reboot() {
    qs -c caelestia kill
    awww kill
    killall mpd
    killall Hyprland
    systemctl reboot
}

case $1 in
logout)
    logout
    ;;
suspend)
    suspend
    ;;
lock)
    lock
    ;;
shutdown)
    shutdown
    ;;
reboot)
    reboot
    ;;
hibernate)
    hibernate
    ;;
esac
