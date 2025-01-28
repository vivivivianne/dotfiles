local M

M.setup = function()
	require("xpm").setup({
		plugins = {
			-- package manager
			'dtomvan/xpm.xplr',
			'gitlab:hartan/web-devicons.xplr',
			{
				'sayanarijit/dual-pane.xplr',
				setup = function()
					require("dual-pane").setup({
						active_pane_width = { Percentage = 70 },
						inactive_pane_width = { Percentage = 30 },
					})
				end
			},
			'dy-sh/dysh-style.xplr',
			'dy-sh/get-rid-of-index.xplr',
			'gitlab:hartan/web-devicons.xplr',
			'igorepst/context-switch.xplr', 'sayanarijit/command-mode.xplr', {
			'sayanarijit/wl-clipboard.xplr',
			setup = function()
				require("wl-clipboard").setup({
					copy_command = "wl-copy -t text/uri-list",
					paste_command = "wl-paste",
					keep_selection = false,
				})
			end
		},
			{
				'sayanarijit/tri-pane.xplr',
				setup = function()
					require('tri-pane').setup({
						layout_key = "T", -- In switch_layout mode
						as_default_layout = false,
						left_pane_width = { Percentage = 20 },
						middle_pane_width = { Percentage = 40 },
						right_pane_width = { Percentage = 40 },
					})
				end
			},
			{
				'sayanarijit/dragon.xplr',
				setup = function()
					require("dragon").setup({
						mode = "selection_ops",
						key = "D",
						drag_args = "",
						drop_args = "",
						keep_selection = false,
						bin = "dragon-drop",
					})
				end
				-- Select files and type `:sD` to drag
				-- Type `:sD` without selecting anything to drop
			},
			'Junker/nuke.xplr',

			-- tool to decompress / compress stuffs
			{
				'dtomvan/ouch.xplr',
				setup = function()
					require("ouch").setup({
						mode = "action",
						key = "o",
					})
				end
			},
			'sayanarijit/zentable.xplr',

		},
		auto_install = true,
		auto_cleanup = true,
	})
end
return M
