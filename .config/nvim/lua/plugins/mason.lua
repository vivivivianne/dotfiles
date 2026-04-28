return {
	{ "williamboman/mason.nvim", opts = {} },
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"clang-format",
                "black",
				"cssls",
				"prettierd",
				"cpptools",
				"cmakelang",
				"lua-language-server",
				"bash-language-server",
				"typescript-language-server",
				"standardjs",
				"html-lsp",
				"json-lsp",
				"cspell",
				"pyright",
				"stylua",
				"shfmt",
			},
		},
	},
}
