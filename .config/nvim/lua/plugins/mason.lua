return {
	{ "williamboman/mason.nvim", opts = {} },
	{ "williamboman/mason-lspconfig.nvim", opts = {} },
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"clang-format",
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
