local home = os.getenv("HOME")
local hypr = home .. "/.config/hypr"
package.path = package.path .. ";" .. home .. "/.config/caelestia/?.lua"

-- Create a file if it doesn't exist, optionally with initial content
local function maybe_create(file, content)
	local f = io.open(file)

	if f then
		f:close()
		return
	end

	f = io.open(file, "w")
	if f then
		if content then
			f:write(content)
		end
		f:close()
	end
end

-- Copy src to dst, but only if dst doesn't already exist
local function maybe_copy(src, dst)
	local out = io.open(dst)
	if out then
		out:close()
		return
	end

	local input = io.open(src, "r")
	if not input then
		return
	end

	out = io.open(dst, "w")
	if out then
		out:write(input:read("*a"))
		out:close()
	end
	input:close()
end

-- Maybe set current colours to defaults
maybe_copy(hypr .. "/scheme/default.lua", hypr .. "/scheme/current.lua")

--hl.monitor({
--	output = "",
--	mode = "preferred",
--	position = "auto",
--	scale = 1,
--})

hl.config({
	input = {
		kb_layout = "br",
		numlock_by_default = true,
		follow_mouse = 1,
		focus_on_close = 1,
		repeat_delay = 250,
		repeat_rate = 50,
		touchpad = {
			--tap-and-drag = true,
			natural_scroll = true,
			--tap-to-click = true,
			scroll_factor = 0.3,
		},
		sensitivity = 0,
	},
})

hl.config({
	group = {
		group_on_movetoworkspace = true,
	},
})

hl.config({
	general = {
		allow_tearing = false,
		resize_on_border = true,
		extend_border_grab_area = 20,
		hover_icon_on_border = true,
		snap = {
			enabled = false,
			window_gap = 32,
			border_overlap = false,
			monitor_gap = 32,
			respect_gaps = true,
		},
	},
})

-- enable dwindlw layout

hl.config({
	dwindle = {
		preserve_split = true,
		smart_split = false,
		smart_resizing = true,
	},
})

hl.config({
	gestures = {
		-- workspace_swipe = true
		workspace_swipe_distance = 700,
		-- workspace_swipe_fingers = 4
		workspace_swipe_cancel_ratio = 0.15,
		workspace_swipe_min_speed_to_force = 5,
		workspace_swipe_direction_lock = true,
		workspace_swipe_direction_lock_threshold = 10,
		workspace_swipe_create_new = true,
	},
})

hl.config({
	misc = {
		disable_hyprland_logo = true,
		disable_autoreload = true,
		disable_splash_rendering = true,
		mouse_move_enables_dpms = false,
		key_press_enables_dpms = true,
		vrr = true,
		animate_manual_resizes = true,
		animate_mouse_windowdragging = true,
		enable_swallow = true,
		swallow_regex = ".*",
		-- new_window_takes_over_fullscreen = 2
		allow_session_lock_restore = true,
		middle_click_paste = false,
		focus_on_activate = false,
		mouse_move_enables_dpms = true,
		key_press_enables_dpms = true,
	},
})

hl.config({
	render = {
		new_render_scheduling = true,
	},
})

hl.config({
	cursor = {
		hide_on_touch = false,
		enable_hyprcursor = true,
	},
})

hl.config({
	decoration = {
		-- screen_shader=~/.config/hypr/screenShader.frag
	},
})

local binds = require("binds")
local env = require("env")
local rules = require("rules")
local monitors = require("monitors")
local workspaces = require("workspaces")
local execs = require("execs")
local style = require("style")
local plugins = require("plugins")
local animations = require("animations")

-- Exec (run every reload)
--hl.on("config.reloaded", function()
--	hl.exec_cmd(
--		"cp -L --no-preserve=mode --update=none ~/.config/hypr/scheme/default.conf ~/.config/hypr/scheme/current.conf"
--	)
--end)
