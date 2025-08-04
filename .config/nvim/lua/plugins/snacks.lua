return {
	"folke/snacks.nvim",
	priority = 1000,
	opts = {
		scroll = {},
		bufdelete = { enabled = false},
		lazygit = { enabled = true, configure = true },
		words = {enabled = false},
		dashboard = {

			preset = {
				pick = function(cmd, opts)
					return LazyVim.pick(cmd, opts)()
				end,
				header = [[
 ⠀ ⠀⡴⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⠀⠀⠀⠀⠀ █████   █████  ███                 
⠀⠀⠀⠚⠁⠀⠳⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠴⠋⠈⢧⠀⠀⠀⠀░░███   ░░███  ░░░                  
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ░███    ░███  ████  █████████████  
⠀⠀⠀⢠⡆⠀⠀⠀⠀⢠⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀ ░███    ░███ ░░███ ░░███░░███░░███ 
⠀⠀⠀⢸⣧⠀⠀⠀⠀⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀⠀⠀⣸⠃⠀⠀⠀⠀ ░░███   ███   ░███  ░███ ░███ ░███ 
⠒⠒⠂⠀⢿⡆⢀⣀⣴⠏⠀⠀⢾⡀⠀⣧⠀⠀⡇⠀⠈⣷⣄⠀⢀⣰⠃⠀⠈⠉⠉⠁  ░░░█████░    ░███  ░███ ░███ ░███ 
⡤⠖⠀⠀⠈⠙⠛⠋⠁⠀⠀⠀⠈⠷⠿⠙⠳⠞⠃⠀⠀⠈⠻⠷⠛⠁⠀⠀⡈⠑⠢⡄    ░░███      █████ █████░███ █████
⠀⢠⠖⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣆⠀⠀     ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░ 
⠘⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⠀                                    
]],

				footer = "amogus",
				-- stylua: ignore
				---@type snacks.dashboard.Item[]
				keys = {
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = "󰠮 ", key = "p", desc = "Projects", action = ":lua require'telescope'.extensions.projects.projects{}" },
					{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
					{ icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{ icon = "󱑤 ", key = "u", desc = "Update", action = ":Lazy update" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
	},
}
