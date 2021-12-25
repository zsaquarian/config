vim.cmd [[
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1

try
  colorscheme gruvbox-material
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
