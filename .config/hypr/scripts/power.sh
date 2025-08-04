#!/bin/bash

logout() {
	# killall waybar
	# swww kill
	killall mpd
	killall Hyprland
}

lock () {
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
	# swww kill
	killall mpd
	killall Hyprland
	sleep 1 && systemctl poweroff
}

reboot() {
	# swww kill
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
