return {
	-- UI Stuff
	{ "echasnovski/mini.icons", version = "*" },
	"nvim-tree/nvim-web-devicons",
	"nvim-lua/plenary.nvim",
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	"RRethy/base16-nvim",
	"ms-jpq/isomorphic_copy",
	"MunifTanjim/nui.nvim",
	"rcarriga/nvim-notify",
	{ "akinsho/toggleterm.nvim", version = "*", config = true, opts = { shade_terminals = false } },
	"sayanarijit/xplr.vim",
	{ "lewis6991/gitsigns.nvim", opts = {} },
	"folke/zen-mode.nvim",
	{ "Aietes/esp32.nvim" },
	-- LSP Support
	{
		"neovim/nvim-lspconfig",
	},
    "nvimtools/none-ls.nvim",
	{ "folke/lsp-colors.nvim", opts = {} },
	-- { "ray-x/lsp_signature.nvim",        },
	{ "mfussenegger/nvim-dap" },
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		opts = {},
	},

	-- Autocompletion and Foormatting
	{ "hrsh7th/nvim-cmp", opts = {} },
	{ "hrsh7th/cmp-nvim-lsp", opts = {} },
	{ "L3MON4D3/LuaSnip", opts = {} },
	-- {"indent-blankline.nvim"},
	{
		{
			"lukas-reineke/indent-blankline.nvim",
			main = "ibl",
			---@module "ibl"
			---@type ibl.config
			opts = {},
		},
	},
}
