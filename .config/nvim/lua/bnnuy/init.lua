---@diagnostic disable: undefined-global

vim.wo.number = true
vim.opt.termguicolors = true
vim.opt.foldmethod = "expr"                     -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.cursorline = false
vim.opt.tabstop = 4
vim.opt.expandtab = false -- convert tabs to spaces
vim.opt.shiftwidth = 4    -- the number of spaces inserted for each indentation
vim.opt.scrolloff = 8     -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.relativenumber = true
vim.opt.fillchars:append { eob = " " }
vim.opt.clipboard = "unnamedplus"

require("bnnuy.colorscheme")
require("bnnuy.remap")
require("bufferline").setup {}
require("toggleterm").setup {
	shade_terminals = false,
	winbar = {
		enabled = false,
		name_formatter = function(term) --  term: Terminal
			return term.name
		end
	},
}

-- Hyprlang Treesitter
vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

local coq = require "coq" -- add this
vim.lsp.config("clangd", coq.lsp_ensure_capabilities()) -- after

-- local esp32 = require "esp32"
-- vim.lsp.config("clangd", esp32.lsp_config()) -- after



-- require 'lspconfig'.clangd.setup { coq.lsp_ensure_capabilities() }

-- require "lsp_signature".setup()

require("mason-lspconfig").setup {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup {}
	end,
}

local dap = require('dap')

dap.configurations.c = {
	{
		type = 'c',
		request = 'launch',
		name = 'Bnnuy',
		program = '~/Projects/Bnnuy/bin/linux/bnnuy',
		-- program = '${workspaceFolder}/dArray',
	}
}

dap.adapters.c = {
	type = 'server',
	port = "${port}",
	executable = {
		command = '/usr/bin/codelldb',
		args = { "--port", "${port}" },
	}
}

vim.lsp.enable("clangd")
