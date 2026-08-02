 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#000000',
    base01 = '#141314',
    base02 = '#1e1e1f',
    base03 = '#929096',
    base04 = '#c9c5cc',
    base05 = '#e5e1e2',
    base06 = '#e5e1e2',
    base07 = '#e5e1e2',
    base08 = '#ffb4ab',
    base09 = '#d7c1ca',
    base0A = '#c9c5cc',
    base0B = '#c8c4d4',
    base0C = '#d7c1ca',
    base0D = '#c8c4d4',
    base0E = '#c9c5cc',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e5e1e2',          bg = '#000000' })
  hi('TelescopeBorder',         { fg = '#929096',             bg = '#000000' })
  hi('TelescopePromptNormal',   { fg = '#e5e1e2',          bg = '#000000' })
  hi('TelescopePromptBorder',   { fg = '#929096',             bg = '#000000' })
  hi('TelescopePromptPrefix',   { fg = '#c8c4d4',             bg = '#000000' })
  hi('TelescopePromptCounter',  { fg = '#c9c5cc',  bg = '#000000' })
  hi('TelescopePromptTitle',    { fg = '#000000',             bg = '#c8c4d4' })
  hi('TelescopePreviewTitle',   { fg = '#000000',             bg = '#c9c5cc' })
  hi('TelescopeResultsTitle',   { fg = '#000000',             bg = '#d7c1ca' })
  hi('TelescopeSelection',      { fg = '#e5e1e2',          bg = '#1e1e1f' })
  hi('TelescopeSelectionCaret', { fg = '#c8c4d4',             bg = '#1e1e1f' })
  hi('TelescopeMatching',       { fg = '#c8c4d4',             bold = true })
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
