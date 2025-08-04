return {
	'nvim-treesitter/nvim-treesitter',
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"html",
				"css",
				"python",
				"bash",
				"json",
				"typescript",
				"cmake",
				"scss",
				"hyprlang" },
			sync_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}
