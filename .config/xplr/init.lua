version = '1.0.0'
local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

-- xplr.config.general.default_ui.prefix = " "
-- xplr.config.general.focus_ui.prefix = "[ "
-- xplr.config.general.focus_ui.suffix = " ]"
-- xplr.config.general.selection_ui.prefix = "{ "
-- xplr.config.general.focus_ui.prefix = "[ "

-- xplr.config.general.initial_layout = "no_help_no_selection" -- Load the example layout


package.path = package.path
	.. ";"
	.. xpm_path
	.. "/?.lua;"
	.. xpm_path
	.. "/?/init.lua"

os.execute(
	string.format(
		"[ -e '%s' ] || git clone '%s' '%s'",
		xpm_path,
		xpm_url,
		xpm_path
	)
)

require("xpm").setup({
	plugins = {
		-- package manager
		'dtomvan/xpm.xplr',
		'gitlab:hartan/web-devicons.xplr',
		-- {
		-- 	'sayanarijit/dual-pane.xplr',
		-- 	setup = function()
		-- 		require("dual-pane").setup({

		-- 			as_default_layout = true,
		-- 			active_pane_width = { Percentage = 70 },
		-- 			inactive_pane_width = { Percentage = 30 },
		-- 		})
		-- 	end
		-- },
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
		-- 'sayanarijit/zentable.xplr',

	},
	auto_install = true,
	auto_cleanup = true,
})



xplr.config.general.panel_ui.default.border_style.fg = "Red"

-- batch rename
xplr.config.modes.builtin.default.key_bindings.on_key.R = {
	help = "batch rename",
	messages = {
		{
			BashExec = [===[
       SELECTION=$(cat "${XPLR_PIPE_SELECTION_OUT:?}")
       NODES=${SELECTION:-$(cat "${XPLR_PIPE_DIRECTORY_NODES_OUT:?}")}
       if [ "$NODES" ]; then
         echo -e "$NODES" | lvim
         "$XPLR" -m ExplorePwdAsync
       fi
     ]===],
		},
	},
}

-- With `export XPLR_BOOKMARK_FILE="$HOME/bookmarks"`
-- Bookmark: mode binding
xplr.config.modes.builtin.default.key_bindings.on_key["b"] = {
	help = "bookmark mode",
	messages = {
		{ SwitchModeCustom = "bookmark" },
	},
}
-- bookmarks
xplr.config.modes.custom.bookmark = {
	name = "bookmark",
	key_bindings = {
		on_key = {
			m = {
				help = "bookmark dir",
				messages = {
					{
						BashExecSilently0 = [[
              PTH="${XPLR_FOCUS_PATH:?}"
              if [ -d "${PTH}" ]; then
                PTH="${PTH}"
              elif [ -f "${PTH}" ]; then
                PTH=$(dirname "${PTH}")
              fi
              PTH_ESC=$(printf %q "$PTH")
              if echo "${PTH:?}" >> "${XPLR_BOOKMARK_FILE:?}"; then
                "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC added to bookmarks"
              else
                "$XPLR" -m 'LogError: %q' "Failed to bookmark $PTH_ESC"
              fi
            ]],
					},
					"PopMode",
				},
			},
			g = {
				help = "go to bookmark",
				messages = {
					{
						BashExec0 = [===[
              PTH=$(cat "${XPLR_BOOKMARK_FILE:?}" | fzf --no-sort)
              if [ "$PTH" ]; then
                "$XPLR" -m 'FocusPath: %q' "$PTH"
              fi
            ]===],
					},
					"PopMode",
				},
			},
			d = {
				help = "delete bookmark",
				messages = {
					{
						BashExec0 = [[
              PTH=$(cat "${XPLR_BOOKMARK_FILE:?}" | fzf --no-sort)
              sd "$PTH\n" "" "${XPLR_BOOKMARK_FILE:?}"
            ]],
					},
					"PopMode",
				},
			},
			esc = {
				help = "cancel",
				messages = {
					"PopMode",
				},
			},
		},
	},
}


-- Type `yy` to copy and `p` to paste files.

local key = xplr.config.modes.builtin.default.key_bindings.on_key

-- Allow movements while on filter/search:
xplr.config.modes.builtin.search.key_bindings.on_key = {
	["ctrl-l"] = {
		help = "Enter",
		messages = { "Enter", "ResetInputBuffer", Search = "" }
	},
	["ctrl-h"] = {
		help = "Back",
		messages = { "Back" }
	},
	["ctrl-j"] = {
		help = "Down",
		messages = { "FocusNext" }
	},
	["ctrl-k"] = {
		help = "Up",
		messages = { "FocusPrevious" }
	},
}


key.o = {
	help = "open",
	messages = {
		{
			Call = {
				command = "zsh",
				args = { '-c',
					'$XDG_CONFIG_HOME/xplr/rifle.py -c $XDG_CONFIG_HOME/xplr/rifle.conf "${XPLR_FOCUS_PATH}"'
				}
			}
		},
		"Enter",
	},
}

--- systemwide yank mode
key.Y = {
	help = "Yank 2 System",
	messages = { { SwitchModeCustom = "yankS" } }
}

xplr.config.modes.custom.yankS = {
	name = "yankS",
	key_bindings = {
		on_key = {
			y = {
				help = "yank focused",
				messages = {
					{ Call = { command = "zsh", args = { '-c', 'wl-copy < "${XPLR_FOCUS_PATH}"' } } },
					{ SwitchMode = "default" }
				},
			},
			s = {
				help = "yank Selected",
				messages = {
					{
						Call = {
							command = "zsh",
							args = { '-c', 'cat $XPLR_PIPE_SELECTION_OUT | while read line; do wl-copy < "$line"; done' }
						}

					},
					{ SwitchMode = "default" }
				},
			}
		},
	},
}


key.Q = {
	help = "Cd & quit",
	messages = {
		"PrintPwdAndQuit"
	}
}

key.v = {
	help = "Quit to Vim",
	messages = {
		"PrintResultAndQuit"
	}
}



xplr.config.modes.builtin.default.key_bindings.on_key.P = {
	help = "preview",
	messages = {
		{
			BashExecSilently0 = [===[
        FIFO_PATH="/tmp/xplr.fifo"

        if [ -e "$FIFO_PATH" ]; then
          "$XPLR" -m StopFifo
          rm -f -- "$FIFO_PATH"
        else
          mkfifo "$FIFO_PATH"
          "$HOME/.config/xplr/imv-open.sh" "$FIFO_PATH" "$XPLR_FOCUS_PATH" &
          "$XPLR" -m 'StartFifo: %q' "$FIFO_PATH"
        fi
      ]===],
		},
	},
}

xplr.config.general.table.col_widths = {
	{ Percentage = 50 },
	{ Percentage = 10 },
	{ Percentage = 10 },
	{ Percentage = 30 },
}
