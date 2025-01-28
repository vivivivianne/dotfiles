return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		sort = { "alpahnum", "group", "mod" },
		win = {
			-- don't allow the popup to overlap with the cursor
			no_overlap = true,
			width = { min = 120, max = 200 },
			height = { min = 7, max = 25 },
			padding = { 2, 2 },
		},
		layout = {
			width = { min = 40 }, -- min and max width of the columns
			spacing = 8, -- spacing between columns
		},
	},
}
