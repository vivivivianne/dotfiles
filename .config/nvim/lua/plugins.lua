return {
	-- UI Stuff
	{ 'echasnovski/mini.icons',  version = "*" },
	'nvim-tree/nvim-web-devicons',
	'nvim-lua/plenary.nvim',
	{ 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
	'RRethy/nvim-base16',
	'ms-jpq/isomorphic_copy',
	"Aietes/esp32.nvim",
	-- { 'psliwka/termcolors.nvim', opts = {} },
	"MunifTanjim/nui.nvim",

	"rcarriga/nvim-notify",
	{ 'akinsho/toggleterm.nvim', version = "*", config = true, opts = { shade_terminals = false } },
	"sayanarijit/xplr.vim",
	{ "lewis6991/gitsigns.nvim", opts = {} },
	"folke/zen-mode.nvim",

	-- LSP Support
	{ 'folke/lsp-colors.nvim', opts = {} },
	{ 'neovim/nvim-lspconfig', opts = {} },
	-- { "ray-x/lsp_signature.nvim",        },
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui",  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }, opts = {} },

	-- Autocompletion and Foormatting
	{ 'hrsh7th/nvim-cmp',      opts = {} },
	{ 'hrsh7th/cmp-nvim-lsp',  opts = {} },
	{ 'L3MON4D3/LuaSnip',      opts = {} },
	"lukas-reineke/indent-blankline.nvim",
	-- {
	-- 'MeanderingProgrammer/render-markdown.nvim',
	-- dependencies = { 'nvim-treesitter/nvim-treesitter'  }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	-- opts = {},
	-- },

}
