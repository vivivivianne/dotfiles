return {
	"Zeioth/hot-reload.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "Signal",
	opts = function()
		return {
			-- Files to be hot-reloaded when modified.
			reload_files = {
				"~/.config/nvim/lua/bnnuy/colorscheme.lua"
			}
		}
	end,
}
