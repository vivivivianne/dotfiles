---@diagnostic disable: undefined-global
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>")
vim.keymap.set("n", "<leader>c", "<C-w>c")
vim.keymap.set("n", "<leader>h", ":noh<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.del("", "<leader>n")

vim.keymap.set("", "<leader>c", ":lua Snacks.bufdelete()<CR>")
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>")

-- Better Movement and Window mappings--
vim.keymap.set("i", "<M-k>", "<Esc>")
vim.keymap.set("", "<M-1>", ":ToggleTerm direction=horizontal <CR>")
vim.keymap.set("", "<M-2>", ":ToggleTerm direction=vertical <CR>")
vim.keymap.set("", "<M-3>", ":ToggleTerm direction=float <CR>")

vim.keymap.set("", "<C-Left>", ":vertical resize -3<CR>")
vim.keymap.set("", "<C-Up>", ":resize +3<CR>")
vim.keymap.set("", "<C-Down>", ":resize -3<CR>")
vim.keymap.set("", "<C-Right>", ":vertical resize +3<CR>")

vim.keymap.set("", "<C-h>", "<C-w>h")
vim.keymap.set("", "<C-l>", "<C-w>l")
vim.keymap.set("", "<C-j>", "<C-w>j")
vim.keymap.set("", "<C-k>", "<C-w>k")

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
	-- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
	vim.keymap.set("t", "<C-h>", "<C-w>h")
	vim.keymap.set("t", "<C-l>", "<C-w>l")
	vim.keymap.set("t", "<C-j>", "<C-w>j")
	vim.keymap.set("t", "<C-k>", "<C-w>k")
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Which-Key Mappings
require("which-key").add({
	-- General --
	{ "<leader>/", '<Plug>(comment_toggle_linewise_visual)', desc = "Comment Toggle", mode = "v" },
	{ "<leader>/", '<Plug>(comment_toggle_linewise_current)', desc = "Comment Toggle", mode = "n" },
	{ icon = { icon = "󰈞", color = "cyan" }, "gd", '<c-]>', desc = "Goto Definition" },
	{ icon = { icon = "󰆗", color = "cyan" }, "<leader>z", '<cmd>ZenMode<cr> ', desc = "Zen Mode Toggle " },
	{ icon = { icon = "󰱝", color = "cyan" }, "<leader>c", desc = "Close Buffer" },
	{ icon = { icon = "󰸱", color = "cyan" }, "<leader>h", desc = "No Highlight" },
	{ icon = { icon = "", color = "cyan" }, "<leader>e", "<cmd>XplrPicker %:p<CR>", desc = "Xplr" },
	{ icon = { icon = "", color = "cyan" }, "<leader>W", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
	{ "<leader>q", "<cmd>q<cr>", desc = "Quit" },
	{ icon = { icon = "", color = "cyan" }, "<leader>w", "<cmd>w<cr>", desc = "Write" },
	{ icon = { icon = "󰕮", color = "cyan" }, "<leader>;", "<cmd>lua Snacks.dashboard()<cr>", desc = "Dashboard" },


	-- Find --
	{ "<leader>f", group = "find " }, -- group
	{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find File", mode = "n" },
	{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent Files" },
	{ "<leader>fn", "<cmd>e<CR>", desc = "New File" },
	{ "<leader>fg", desc = "Live Grep" },
	{ "<leader>fb", desc = "Find Buffer" },
	{ "<leader>fG", desc = "Git" },
	{ "<leader>fh", desc = "Help" },
	{ "<leader>fc", desc = "Colorscheme" },


	-- Git --
	{ "<leader>g", group = "Git" },
	{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
	{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
	{ "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit (current file)" },
	{ "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff" },
	{ "<leader>gg", "<cmd>lua Snacks.lazygit.open()<cr>", desc = "LazyGit" },
	{ "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk" },
	{ "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev Hunk" },
	{ "<leader>gl", "<cmd>Gitsigns blame_line<cr>", desc = "Blame" },
	{ "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed File" },
	{ "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk" },
	{ "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk" },
	{ "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset Buffer" },
	{ "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk" },
	{ "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo Stage Hunk" },

	-- Debug --
	{ "<leader>d", group = "Debug" },
	{ "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
	{ "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", desc = "Start" },
	{ "<leader>dp", "<cmd>lua require'dap'.pause()<cr>", desc = "Pause" },
	{ "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect" },
	{ "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run To Cursor" },
	{ "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
	{ "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
	{ "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl" },
	{ "<leader>dU", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle UI" },
	{ "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },
	{ "<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit" },
	{ "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session" },
	{ "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back" },
	{ "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },

	-- Lazy --
	{ "<leader>L", group = "Lazy" },
	{ "<leader>Lu", "<cmd>Lazy update<cr>", desc = "Update" },
	{ "<leader>Ls", "<cmd>Lazy Status<cr>", desc = "Status" },
	{ "<leader>Li", "<cmd>Lazy install<cr>", desc = "Install" },
	{ "<leader>Lc", "<cmd>Lazy clean<cr>", desc = "Clean" },

	-- LSP --
	{ icon = { icon = "", color = "cyan" }, "<leader>l", group = "LSP" },
	{ "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
	{ "<leader>lI", "<cmd>Mason<cr>", desc = "Mason Info" },
	{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
	{ "<leader>lq", "<cmd>copen<cr>", desc = "Quickfix" },
	{ "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
	{ "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
	{ "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format" },
	{ "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
	{ "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
	{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
	{ "<leader>le", "<cmd>Telescope quickfix<cr>", desc = "Telescope Quickfix" },
	{ "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", desc = "Buffer Diagnostics" },
	{ "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },

	-- Treesitter
	{ icon = { icon = "󰔱", color = "cyan" }, "<leader>T", group = "Treesitter" },
	{ "<leader>Ti", "<cmd>TSConfigInfo<cr>", desc = "Info" },

	-- ESP
	{ icon = {icon = " ", color="cyan"},"<leader>R", group = "Esp" },

	-- Trouble --
	{ icon = { icon = "󰺮", color = "cyan" }, "<leader>t", group = "Trouble" },
	{
		"<leader>b",
		group = "Buffers",
		expand = function()
			return require("which-key.extras").expand.buf()
		end
	},
})

-- Telescope --

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fc', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>fG', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
