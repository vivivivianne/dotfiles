 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#121316',
    base01 = '#1e2022',
    base02 = '#282a2d',
    base03 = '#8d9198',
    base04 = '#c3c7cf',
    base05 = '#e2e2e5',
    base06 = '#e2e2e5',
    base07 = '#e2e2e5',
    base08 = '#ffb4ab',
    base09 = '#e5b8e7',
    base0A = '#bbc8da',
    base0B = '#a7caf2',
    base0C = '#e5b8e7',
    base0D = '#a7caf2',
    base0E = '#bbc8da',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e2e2e5',          bg = '#121316' })
  hi('TelescopeBorder',         { fg = '#8d9198',             bg = '#121316' })
  hi('TelescopePromptNormal',   { fg = '#e2e2e5',          bg = '#121316' })
  hi('TelescopePromptBorder',   { fg = '#8d9198',             bg = '#121316' })
  hi('TelescopePromptPrefix',   { fg = '#a7caf2',             bg = '#121316' })
  hi('TelescopePromptCounter',  { fg = '#c3c7cf',  bg = '#121316' })
  hi('TelescopePromptTitle',    { fg = '#121316',             bg = '#a7caf2' })
  hi('TelescopePreviewTitle',   { fg = '#121316',             bg = '#bbc8da' })
  hi('TelescopeResultsTitle',   { fg = '#121316',             bg = '#e5b8e7' })
  hi('TelescopeSelection',      { fg = '#e2e2e5',          bg = '#282a2d' })
  hi('TelescopeSelectionCaret', { fg = '#a7caf2',             bg = '#282a2d' })
  hi('TelescopeMatching',       { fg = '#a7caf2',             bold = true })
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
