-- ================================================================================
-- =                                      UI                                      =
-- ================================================================================

vim.o.showmode = false -- dont show mode in command area (statusline already shows it)

-- === Lualine ===
require('lualine').setup{
  options = { theme = 'gruvbox' },
  sections = { lualine_a = { 'mode' }, lualine_b = { 'branch' }, lualine_c = { 'filename' }, lualine_x = { { 'diagnostics', sources = { 'coc' } } }, lualine_y = { 'filetype' }, lualine_z = { 'location', 'progress' } }
}

-- === Neoscroll ===
require('neoscroll').setup({
  mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', 'j', 'k',
              '<C-y>', '<C-e>', 'zt', 'zz', 'zb', 'gj', 'gk'},
})

-- gruvbox material config
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_enable_italic = true
vim.g.gruvbox_material_enable_bold = true
vim.g.gruvbox_material_transparent_background = true
vim.g.gruvbox_material_diagnostic_text_highlight = true
vim.g.gruvbox_material_statusline_style = 'mix'
vim.g.gruvbox_material_palette = 'mix'

vim.cmd( "colo gruvbox-material" ) -- set colorscheme
-- cursor shapes
-- let &t_SI = "\e[6 q"
-- let &t_SI = "\e[6 q"
-- let &t_EI = "\e[2 q"

-- if exists('+termguicolors')
--   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
--   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
--   set termguicolors
-- endif

-- undotree
vim.g.undotree_WindowLayout = 3
vim.g.undotree_ShortIndicators = 1

-- blameline
vim.g.blameLineVirtualTextFormat = ' | %s | '
vim.g.blameLineGitFormat = '%an, %ar - %s'

