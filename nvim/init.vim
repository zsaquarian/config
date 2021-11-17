source ~/.config/nvim/plugins.vim " Plugins!
source ~/.config/nvim/ginit.vim " GUI stuff

" ==============================================================================
" =                                EDITOR OPTIONS                              =
" ==============================================================================

" Keep undos even after reboots
set undofile

" makes everything snappier
set updatetime=50
" Use space as leader
nnoremap <SPACE> <Nop>
let g:mapleader="\<Space>"

" don't *really* close buffers
set hidden

" allow all things using mouse
set mouse=a

set showtabline=2

set ttimeoutlen=1 " make key presses show up faster
set number relativenumber " show line numbers

set clipboard+=unnamedplus " use system clipboard
set shortmess+=c " better completion menu
set signcolumn=auto " only show signcolumn when there are things to show
set tabstop=2 " Use two space tab
set shiftwidth=2 " Indentation amount for > and < commands
set expandtab " convert tab to spaces
set encoding=utf-8 " Use utf-8
set textwidth=80 " 80 chars in a line

set foldcolumn=1 " defines 1 col at window left, to indicate folding
let javaScript_fold=1 " activate folding by JS syntax

" nice indentline
let g:indentLine_char = '▏' " Best chars for indentline ¦, ┆, │, ⎸, or ▏
let g:indentLine_defaultGroup = 'Comment'
let g:indent_blankline_char_highlight_list=['red','yellow','green','cyan','blue']

" case options
set smartcase
set ignorecase

" don't highlight search results after searching
set nohlsearch

" correct splits
set splitbelow
set splitright

set backspace=eol,start " make backspace act like it normally does
set shell=bash " use bash as shell because fish breaks a lot of plugins

" spelling correction
imap <c-f> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <c-f> [s1z=<c-o>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T'] " only show quickscope when trying to find something

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" tell better whitespace to ignore certain filetypes
let g:better_whitespace_filetypes_blacklist=['dashboard', 'NvimTree',
      \ 'diff', 'gitcommit', 'help']

" === Telescope ===

lua << EOF
require('telescope').load_extension('coc')
EOF

" === COC config ===

filetype plugin indent on
syntax on " switch on syntax highlighting

nnoremap <a-s> :Telescope coc line_code_actions<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Emmet setup
let g:user_emmet_leader_key = ','

" svelte config
let g:vim_svelte_plugin_use_typescript = 1
let g:vim_svelte_plugin_use_foldexpr = 0

let g:sneak#label=1

" terminal

function s:RunNeoTerminal(cmd)
  exec ":terminal " . a:cmd
  " terminal runs by default in insert mode which kills the buffer after exit,
  " let's change to normal mode
  exec ":stopinsert"
  keepalt file cmd
endfunction
command Tmux call s:RunNeoTerminal('tmux -u')

let g:dashboard_default_executive = 'telescope'

let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]

lua <<EOF
require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  },
  autotag = {
    enable = true,
  },
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {  }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {  },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" ================================================================================
" =                                      UI                                      =
" ================================================================================

set noshowmode " dont show mode in command area (statusline already shows it)

" === Lualine ===
lua << EOF
require('lualine').setup{
  options = { theme = 'gruvbox' },
  sections = { lualine_a = { 'mode' }, lualine_b = { 'branch' }, lualine_c = { 'filename' }, lualine_x = { { 'diagnostics', sources = { 'coc' } } }, lualine_y = { 'filetype' }, lualine_z = { 'location', 'progress' } }
}
EOF

" === Neoscroll ===
lua << EOF
require('neoscroll').setup({
  mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', 'j', 'k',
              '<C-y>', '<C-e>', 'zt', 'zz', 'zb', 'gj', 'gk'},
})
EOF

" gruvbox material config
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_diagnostic_text_highlight = 1
let g:gruvbox_material_statusline_style = 'mix'
let g:gruvbox_material_palette = 'mix'

colo gruvbox-material " set colorscheme
" cursor shapes
let &t_SI = "\e[6 q"
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" undotree
let g:undotree_WindowLayout = 3
let g:undotree_ShortIndicators = 1

" blameline
let g:blameLineVirtualTextFormat = ' | %s | '
let g:blameLineGitFormat = '%an, %ar - %s'

augroup myCmds
au!
autocmd VimEnter * silent hi Comment cterm=italic gui=italic
autocmd FileType * let b:coc_additional_keywords = ["-"]
" autocmd FileType svelte setlocal foldmethod=indent
autocmd TermOpen * setlocal wrap nonumber norelativenumber filetype=terminal
autocmd FileType vim,dashboard,terminal silent IndentBlanklineDisable
autocmd FileType markdown setlocal spell
autocmd CursorMoved,CursorMovedI * silent IndentBlanklineRefresh
autocmd BufEnter * silent EnableBlameLine
augroup END

" ================================================================================
" =                               KEY BINDINGS                                   =
" ================================================================================

" buffer next and buffer previous
nnoremap <leader>bn :BufferNext<CR>
nnoremap <leader>bp :BufferPrevious<CR>

nnoremap <leader>bw :BufferWipe<CR>
nnoremap <leader>bd :BufferDelete<CR>
nnoremap ;q :BufferClose<CR>

nnoremap <leader>tf :NvimTreeToggle<CR>

nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
nnoremap <silent> <Leader>fl :Telescope current_buffer_fuzzy_find<CR>

" Move around easier
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

" === COC shortcuts === "

imap <a-s> <esc><Plug>(coc-codeaction-cursor)a
nmap <a-s> <Plug>(coc-codeaction-cursor)
nmap <silent> <leader>FF :Prettier<CR>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <F2> <Plug>(coc-rename)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

inoremap <silent><expr> <c-space> coc#refresh()

" === Terminal Stuff ===
tnoremap <ESC><ESC> <C-\><C-n>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" === Undo tree ===
nnoremap <F5> :UndotreeToggle<CR>
