---@diagnostic disable: undefined-global

vim.wo.number = true
vim.opt.termguicolors = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter@foldexpr()"
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.cursorline = false
vim.opt.tabstop = 4
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.relativenumber = true
vim.opt.fillchars:append({ eob = " " })
vim.opt.clipboard = "unnamedplus"

require("bnnuy.colorscheme")
require("bnnuy.remap")

local highlight = {
	"IblIndent",
}
require("ibl").setup({
	indent = { highlight = highlight, char = "▏" },
	scope = { enabled = false },
})
require("bufferline").setup({})
require("toggleterm").setup({
	shade_terminals = false,
	winbar = {
		enabled = false,
		name_formatter = function(term) --  term: Terminal
			return term.name
		end,
	},
})

-- Hyprlang Treesitter
vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

local coq = require("coq")

vim.lsp.config("clangd", coq.lsp_ensure_capabilities({
  cmd = {
    "clangd",
    "--background-index",
    "--query-driver=**", -- Or provide exact path to xtensa-esp32-elf-gcc
    "--compile-commands-dir=build" -- Point to the directory containing compile_commands.json
  },
  -- Additional settings if needed
}))


local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
    },
})

local dap = require("dap")

dap.configurations.c = {
	{
		type = "c",
		request = "launch",
		name = "Bnnuy",
		program = "${workspaceFolder}/bin/linux/bnnuy",
		-- program = '${workspaceFolder}/dArray',
	},
}

dap.adapters.c = {
	type = "server",
	port = "${port}",
	executable = {
		command = "/usr/bin/codelldb",
		args = { "--port", "${port}" },
	},
}


vim.cmd([[autocmd Signal SIGUSR1 source ~/.config/nvim/lua/bnnuy/colorscheme.lua]])
vim.cmd([[autocmd Signal SIGUSR1 source ~/.config/nvim/lua/bnnuy/init.lua]])
