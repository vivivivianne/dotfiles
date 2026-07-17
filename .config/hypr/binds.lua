---@module 'hl'

local vars = require("variables")

-- Launcher
hl.bind("SUPER+SUPER_L", hl.dsp.global("caelestia:launcher"), { release = true })

-- Misc
--hl.bind(vars.kbSession, hl.dsp.global("caelestia:session"))
--hl.bind(vars.kbShowSidebar, hl.dsp.global("caelestia:sidebar"))
--hl.bind(vars.kbClearNotifs, hl.dsp.global("caelestia:clearNotifs"), { locked = true })
--hl.bind(vars.kbShowPanels, hl.dsp.global("caelestia:showall"))
--hl.bind(vars.kbLock, hl.dsp.global("caelestia:lock"))

-- Restore lock
hl.bind(vars.kbRestoreLock, function()
	hl.dispatch(hl.dsp.exec_cmd("caelestia shell -d"))
	hl.dispatch(hl.dsp.global("caelestia:lock"))
end)

-- Kill/restart
hl.bind("CTRL + SUPER + SHIFT + R", hl.dsp.exec_cmd("qs -c caelestia kill"), { release = true })
hl.bind(
	"CTRL + SUPER + ALT + R",
	hl.dsp.exec_cmd("qs -c caelestia kill; sleep .1; caelestia shell -d"),
	{ release = true }
)

-- AUDIO BINDS #
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("SUPER+SHIFT+M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 10%+"),
	{ locked = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-"),
	{ locked = true }
)

-- PLAYERCTL BINDS
local home = os.getenv("HOME") or ""
hl.bind("code:172", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/volctrl.sh music pause"))
hl.bind("SUPER + code:61", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/volctrl.sh music pause"))
hl.bind("ALT + code:173", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/volctrl.sh music prev_player"))
hl.bind("ALT + code:171", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/volctrl.sh music next_player"))
hl.bind("SUPER+SHIFT + code:59", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/volctrl.sh music prev_player"))
hl.bind("SUPER+SHIFT + code:60", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/volctrl.sh music next_player"))
hl.bind("code:173", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/volctrl.sh music prev"))
hl.bind("code:171", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/volctrl.sh music next"))
hl.bind("SUPER + code:59", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/volctrl.sh music prev"))
hl.bind("SUPER + code:60", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/volctrl.sh music next"))
hl.bind("SUPER + code:97", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/volctrl.sh music shuffle"))
hl.bind("SUPER + code:21", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/volctrl.sh music up"))
hl.bind("SUPER + code:20", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/volctrl.sh music down"))
hl.bind("SUPER + XF86AudioRaiseVolume", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/volctrl.sh music up"))
hl.bind("SUPER + XF86AudioLowerVolume", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/volctrl.sh music down"))

-- BRIGHTNESS
hl.bind("XF86MonBrightnessUp", hl.dsp.global("caelestia:brightnessUp"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.global("caelestia:brightnessDown"), { locked = true })

-- PROGRAM BINDS #
--
-- TUI
hl.bind("SUPER+RETURN", hl.dsp.exec_cmd("kitty --title kitty --single-instance"))
hl.bind("SUPER+A", hl.dsp.exec_cmd("kitty --single-instance --class=pavucontrol -T 'pavucontrol' -e pulsemixer"))
hl.bind("SUPER+ALT+R", hl.dsp.exec_cmd("kitty --single-instance -e ranger"))
hl.bind("SUPER+SHIFT+x", hl.dsp.exec_cmd("kitty --single-instance --class=pavucontrol -T 'xplr' -e xplr"))

-- Clipboard and emoji picker
-- bind = SUPER, C, exec, pkill fuzzel || caelestia clipboard
-- bind = SUPER+ALT, C, exec, pkill fuzzel || caelestia clipboard -d
-- bind = SUPER, E, exec, pkill fuzzel || caelestia emoji -p
-- bindl = Ctrl+SHIFT+ALT, V, exec, sleep 0.5s && ydotool type -d 1 "$(cliphist list | head -1 | cliphist decode)"  # ALTernate paste
-- bind=SUPER,D,exec,rofi -show drun
hl.bind(
	"SUPER+E",
	hl.dsp.exec_cmd("rofimoji --selector rofi --typer wtype --clipboarder wl-copy --action type copy clipboard")
)
hl.bind("SUPER+C", hl.dsp.exec_cmd("cliphist list| rofi -dmenu --allow-images| cliphist decode| wl-copy"))
hl.bind("SUPER+ALT+E", hl.dsp.global("caelestia:lock"))
hl.bind("SUPER+SHIFT+E", hl.dsp.global("caelestia:session"))
-- bind=SUPER+SHIFT,E,exec, ~/.config/rofi/powermenu/powermenu.sh
hl.bind("SUPER+D", hl.dsp.exec_cmd("caelestia shell drawers toggle dashboard"))
hl.bind("SUPER+N", hl.dsp.exec_cmd("caelestia shell drawers toggle sidebar"))
hl.bind("SUPER+ALT+P", hl.dsp.exec_cmd("caelestia pip"))
-- Move window to picture-in-picture mode
-- bind=SUPER+SHIFT,W,exec,thunar
-- copy-paste / recording utils
hl.bind("SUPER+CTRL+v", hl.dsp.exec_cmd("wl-paste -t text/uri-list"))
hl.bind("SUPER+i", hl.dsp.exec_cmd("imv ~/.config/hypr/images/kblayout.png"))
-- bind=,Print,exec, hyprshot -m region --clipboard-only
hl.bind("SHIFT+Print", hl.dsp.exec_cmd("caelestia screenshot"), { locked = true })
-- Full screen capture > clipboard
hl.bind("Print", hl.dsp.global("caelestia:screenshotFreeze"))
-- Capture region (freeze)
hl.bind("SUPER+SHIFT+Print", hl.dsp.exec_cmd("caelestia record -s"))
-- Record screen with sound
hl.bind("SUPER+SHIFT+ALT+Print", hl.dsp.exec_cmd("caelestia record -r"))
-- Record region
hl.bind("SUPER+SHIFT+C", hl.dsp.exec_cmd("hyprpicker -a"))
-- Colour picker
-- HYPRLAND BINDS #
hl.bind("SUPER+SHIFT+R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind("SUPER+ALT+SHIFT+R", hl.dsp.exec_cmd("hyprctl reload && qs -c caelestia kill; caelestia shell -d"))
-- bind = SUPER+SHIFT, G, exec, ~/.config/hypr/scripts/gamemode.sh
hl.bind("SUPER+ALT+X", hl.dsp.exec_cmd("~/.config/hypr/scripts/xdg-portal-reset.sh"))
-- Window Manipulation
hl.bind("SUPER+V", hl.dsp.layout("togglesplit"))
hl.bind("SUPER+Q", hl.dsp.window.close())
hl.bind("SUPER+SHIFT+Q", hl.dsp.window.kill())
hl.bind("ALT+SPACE", hl.dsp.window.float())
hl.bind("SUPER+SHIFT+P", hl.dsp.window.pin())
hl.bind("SUPER+P", hl.dsp.window.pseudo())
hl.bind("SUPER+f", hl.dsp.window.fullscreen())
hl.bind("SUPER+SHIFT+f", hl.dsp.window.fullscreen())
-- some nice mouse binds
hl.bind("SUPER+mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER+mouse:273", hl.dsp.window.resize(), { mouse = true })

-- =========================================================================
-- Window Movement & Focus
-- =========================================================================

-- Focus movement
hl.bind("SUPER + h", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "up" }))

-- Window movement (moving the window itself)
hl.bind("SUPER+SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER+SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER+SHIFT + j", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER+SHIFT + k", hl.dsp.window.move({ direction = "up" }))

-- Active window micro-movements (Floating / Active Move)
hl.bind("SUPER + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + j", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
-- =========================================================================
-- Group Bindings
-- =========================================================================

hl.bind("SUPER + w", hl.dsp.group.toggle())
hl.bind("ALT + h", hl.dsp.group.next({ forward = false }))
hl.bind("ALT + l", hl.dsp.group.next())

-- Move window into groups
hl.bind("SUPER+ALT + h", hl.dsp.window.move({ into_group = "left" }))
hl.bind("SUPER+ALT + j", hl.dsp.window.move({ into_group = "down" }))
hl.bind("SUPER+ALT + l", hl.dsp.window.move({ into_group = "right" }))
hl.bind("SUPER+ALT + k", hl.dsp.window.move({ into_group = "up" }))

-- Move window out of groups
hl.bind("SUPER+SHIFT+ALT + h", hl.dsp.window.move({ out_of_group = true }))
hl.bind("SUPER+SHIFT+ALT + j", hl.dsp.window.move({ out_of_group = true }))
hl.bind("SUPER+SHIFT+ALT + l", hl.dsp.window.move({ out_of_group = true }))
hl.bind("SUPER+SHIFT+ALT + k", hl.dsp.window.move({ out_of_group = true }))

hl.bind("ALT + g", hl.dsp.group.lock())

-- =========================================================================
-- Resize Submap
-- =========================================================================
hl.bind("SUPER + R", hl.dsp.submap("resize"))

-- =========================================================================
-- Resize Submap (Defined at the top-level, outside the global block)
-- =========================================================================
hl.define_submap("resize", function()
	-- Fast resizing (40px increments)
	hl.bind("SHIFT + l", hl.dsp.window.resize({ x = 40, y = 0, relative = true }), { repeating = true })
	hl.bind("SHIFT + h", hl.dsp.window.resize({ x = -40, y = 0, relative = true }), { repeating = true })
	hl.bind("SHIFT + k", hl.dsp.window.resize({ x = 0, y = -40, relative = true }), { repeating = true })
	hl.bind("SHIFT + j", hl.dsp.window.resize({ x = 0, y = 40, relative = true }), { repeating = true })

	-- Normal resizing (10px increments)
	hl.bind("l", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind("h", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind("k", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
	hl.bind("j", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

	-- Escape paths to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
end)
-- Workspace binds
hl.bind("SHIFT+ALT+j", hl.dsp.focus({ workspace = "+1" }))
hl.bind("SHIFT+ALT+k", hl.dsp.focus({ workspace = -1 }))
hl.bind("SUPER+1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER+2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER+3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER+4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER+5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER+6", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER+7", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER+8", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER+9", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER+0", hl.dsp.focus({ workspace = 10 }))
hl.bind("SUPER+S", hl.dsp.workspace.toggle_special(nil))
hl.bind("SUPER+SHIFT+1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER+SHIFT+2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER+SHIFT+3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER+SHIFT+4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER+SHIFT+5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER+SHIFT+6", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER+SHIFT+7", hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER+SHIFT+8", hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER+SHIFT+9", hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER+SHIFT+0", hl.dsp.window.move({ workspace = 10 }))
hl.bind("SUPER+SHIFT+S", hl.dsp.window.move({ workspace = "special" }, { follow = false }))
hl.bind("SUPER+mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER+mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Exec (run every reload)
hl.on("config.reloaded", function()
	hl.exec_cmd("hyprctl dispatch submap global")
end)
