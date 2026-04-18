return {
	-- UI Stuff
	{ "echasnovski/mini.icons", version = "*" },
	"nvim-tree/nvim-web-devicons",
	"nvim-lua/plenary.nvim",
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	"RRethy/base16-nvim",
	"ms-jpq/isomorphic_copy",
	"Aietes/esp32.nvim",
	"MunifTanjim/nui.nvim",

	"rcarriga/nvim-notify",
	{ "akinsho/toggleterm.nvim", version = "*", config = true, opts = { shade_terminals = false } },
	"sayanarijit/xplr.vim",
	{ "lewis6991/gitsigns.nvim", opts = {} },
	"folke/zen-mode.nvim",

	-- LSP Support
	{
		"neovim/nvim-lspconfig",
		opts = function(_, opts)
			local esp32 = require("esp32")
			opts.servers = opts.servers or {}
			opts.servers.clangd = esp32.lsp_config()
			return opts
		end,
	},
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
