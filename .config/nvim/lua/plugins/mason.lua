return {
	{'williamboman/mason.nvim', opts = {}},
	{'williamboman/mason-lspconfig.nvim',opts = {}},
	{'WhoIsSethDaniel/mason-tool-installer.nvim', 
		opts = {
		ensure_installed = {
			"clangd",
			"clang-format",
			"cpptools",
			"cmakelang",
			"cspell",
			"lua-language-server",
			"bash-language-server",
			"html-lsp",
			"eslint-lsp",
			"json-lsp",
			"pyright",
			"quick-lint-js",
			"tailwindcss-language-server",
			"stylua",
			"shfmt" }
		} 
	},

}
