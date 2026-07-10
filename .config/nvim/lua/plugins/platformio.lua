return {
  'anurag3301/nvim-platformio.lua',

  -- Dependencies are lazy-loaded by default unless specified otherwise.
  dependencies = {
    { 'nvim-telescope/telescope.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'folke/which-key.nvim' },
    { 'nvim-treesitter/nvim-treesitter' },

    -- install picker based on your likeing
    { 'akinsho/toggleterm.nvim' },
  },
}
