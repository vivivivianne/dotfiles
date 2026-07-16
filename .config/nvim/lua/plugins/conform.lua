return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	init = function()
		-- This forces Neovim's native vim.lsp.buf.format to route through conform
		vim.o.formatexpr = 'v:lua.require("conform").formatexpr()'
	end,
	opts = {
		notify_on_error = true, -- Adds an alert popup when Prettier fails
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "prettier" },
			vue = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			lua = { "stylua" },
		},
		formatters = {
			prettier = {
				prepend_args = { "--tab-width", "3" },
			},
		},
		-- Configures how conform responds to LSP formatting requests
		lsp_format = "prefer",

		-- Triggers formatting automatically via LSP save events
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "prefer",
		},
	},
}
