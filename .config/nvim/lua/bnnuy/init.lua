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

vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--background-index",
		"--query-driver=**",
		"--limit-results=100",
		"--compile-commands-dir=build",
	},
})
vim.lsp.enable("clangd")

-- vim.lsp.config('prettier', {
--   cmd = { vim.fn.exepath('prettier'), '--stdio' }, -- Ensures it's the right path
--   root_dir = vim.fs.dirname(vim.fs.find({'.prettierrc', 'package.json'}, { upward = true })[1]),
-- })
-- vim.lsp.enable("prettier")

-- vim.lsp.enable("ccls")

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

vim.g.pioConfig = {
	lsp = "ccls", -- value: clangd | ccls
	clangd_source = "ccls", -- value: ccls | compiledb, For detailed explation check :help platformio-clangd_source
	picker_backend = "auto", -- value: auto | telescope | ui_select, default: auto, check :help platformio-picker
	menu_key = "<leader>p", -- replace this menu key  to your convenience
	debug = false, -- enable debug messages
}
local pok, platformio = pcall(require, "platformio")
if pok then
	platformio.setup(vim.g.pioConfig)
end

vim.cmd([[autocmd Signal SIGUSR1 source ~/.config/nvim/lua/bnnuy/colorscheme.lua]])
vim.cmd([[autocmd Signal SIGUSR1 source ~/.config/nvim/lua/bnnuy/init.lua]])
