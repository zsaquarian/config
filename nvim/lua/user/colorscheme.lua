vim.cmd [[
let g:gruvbox_material_background = 'hard'

try
  colorscheme gruvbox-material
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
