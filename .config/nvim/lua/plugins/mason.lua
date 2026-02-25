return {
	{'williamboman/mason.nvim', opts = {}},
	{'williamboman/mason-lspconfig.nvim',opts = {}},
	{'WhoIsSethDaniel/mason-tool-installer.nvim', 
		opts = {
		ensure_installed = {
			"clang-format",
			"cpptools",
			"cmakelang",
			"lua-language-server",
			"bash-language-server",
			"html-lsp",
			"eslint-lsp",
			"json-lsp",
			"cspell",
			"pyright",
			"quick-lint-js",
			"tailwindcss-language-server",
			"stylua",
			"shfmt" }
		} 
	},

}
