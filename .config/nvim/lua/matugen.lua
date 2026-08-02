 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#000000',
    base01 = '#191114',
    base02 = '#231c1f',
    base03 = '#9d8c91',
    base04 = '#d5c2c7',
    base05 = '#eedfe2',
    base06 = '#eedfe2',
    base07 = '#eedfe2',
    base08 = '#ffb4ab',
    base09 = '#f1bb97',
    base0A = '#e1bdc9',
    base0B = '#ffb0cf',
    base0C = '#f1bb97',
    base0D = '#ffb0cf',
    base0E = '#e1bdc9',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#eedfe2',          bg = '#000000' })
  hi('TelescopeBorder',         { fg = '#9d8c91',             bg = '#000000' })
  hi('TelescopePromptNormal',   { fg = '#eedfe2',          bg = '#000000' })
  hi('TelescopePromptBorder',   { fg = '#9d8c91',             bg = '#000000' })
  hi('TelescopePromptPrefix',   { fg = '#ffb0cf',             bg = '#000000' })
  hi('TelescopePromptCounter',  { fg = '#d5c2c7',  bg = '#000000' })
  hi('TelescopePromptTitle',    { fg = '#000000',             bg = '#ffb0cf' })
  hi('TelescopePreviewTitle',   { fg = '#000000',             bg = '#e1bdc9' })
  hi('TelescopeResultsTitle',   { fg = '#000000',             bg = '#f1bb97' })
  hi('TelescopeSelection',      { fg = '#eedfe2',          bg = '#231c1f' })
  hi('TelescopeSelectionCaret', { fg = '#ffb0cf',             bg = '#231c1f' })
  hi('TelescopeMatching',       { fg = '#ffb0cf',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
