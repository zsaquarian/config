source ~/.config/nvim/plugins.vim " Plugins!

" ==============================================================================
" =                                EDITOR OPTIONS                              =
" ==============================================================================

" makes everything snappier
set updatetime=50
" Use space as leader
nnoremap <SPACE> <Nop>
let g:mapleader="\<Space>"

" don't *really* close buffers
set hidden

" allow all things using mouse
set mouse=a

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

" folding
set foldmethod=syntax " syntax highlighting items specify folds
set foldcolumn=1 " defines 1 col at window left, to indicate folding
let javaScript_fold=1 " activate folding by JS syntax

" nice indentline
let g:indentLine_char = '▏' " Best chars for indentline ¦, ┆, │, ⎸, or ▏
let g:indentLine_defaultGroup = 'Comment'

" echodoc setup
let g:echodoc#enable_at_startup = 1
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

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T'] " only show quickscope when trying to find something

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" minimap key binding
nnoremap <silent> <leader>tm :MinimapToggle<CR>

" tell better whitespace to ignore certain filetypes
let g:better_whitespace_filetypes_blacklist=['minimap', 'NvimTree',
      \ 'diff', 'gitcommit', 'help']

" === FZF ===
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
let g:fzf_preview_window = ['right:30%:hidden', 'ctrl-/']

nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>bb :Buffers<CR>
nnoremap <silent> <leader>fl :Lines<CR>

command! -nargs=0 Prettier :CocCommand prettier.formatFile

filetype plugin indent on
syntax on " switch on syntax highlighting

" === CocExplorer ===
nnoremap <silent> <leader>tf :CocCommand explorer<CR>

" === NeoSnippet === "
" Map <C-cr> as shortcut to activate snippet if available
imap <C-cr> <Plug>(neosnippet_expand_or_jump)
smap <C-cr> <Plug>(neosnippet_expand_or_jump)
xmap <C-cr> <Plug>(neosnippet_expand_target)

" Load custom snippets from snippets folder
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

" Hide conceal markers
let g:neosnippet#enable_conceal_markers = 0

" ==== COC Setup ====

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
inoremap <silent><expr> <c-space> coc#refresh()


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <F2> <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

nmap <leader>fq  <Plug>(coc-fix-current)

" tell bufferline not to echo
let g:bufferline_echo = 0

" === Lightline ===
function! LightlineReadonly()
  return &readonly && &filetype !~# '\v(help|NvimTree)' ? 'RO' : ''
endfunction

function! LightlineGit()
  let branch = FugitiveHead()
  return substitute(' ', '$', branch, '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'srcery',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch' ],
      \             [ 'readonly', 'modified', 'buffers'  ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent', 'filetype' ],
      \             [ 'coc_status', 'coc_ok', 'coc_errors', 'coc_warnings', 'coc_info' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightlineGit',
      \   'readonly': 'LightlineReadonly',
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

call lightline#coc#register()

" === Vista ===
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

let g:vista_default_executive = 'coc'

" toggle tags
nnoremap <silent> <leader>tt :Vista!!<CR>

" Emmet setup
let g:user_emmet_leader_key = ','

" startify setup
let g:startify_custom_header = [
      \ '   _   _               _   _  _',
      \ '  | \ | |             | | | |(_)',
      \ '  |  \| |  ___   ___  | | | | _  _ __ ___',
      \ '  | . ` | / _ \ / _ \ | | | || || |_ ` _ \',
      \ '  | |\  ||  __/| (_) |\ \_/ /| || | | | | |',
      \ '  \_| \_/ \___| \___/  \___/ |_||_| |_| |_|',
      \ ]

" svelte config
let g:vim_svelte_plugin_use_typescript = 1
let g:vim_svelte_plugin_use_foldexpr = 1

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

" ================================================================================
" =                                      UI                                      =
" ================================================================================

set noshowmode " dont show mode in command area (lightline already shows it)
colo srcery " set colorscheme
let g:srcery_inverse_match_paren=1 " colorscheme config
set winbl=10 " make floating windows slightly transparent
" cursor shapes
let &t_SI = "\e[6 q"
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

augroup myCmds
au!
autocmd VimEnter * silent hi Comment cterm=italic gui=italic
autocmd FileType * let b:coc_additional_keywords = ["-"]
" autocmd FileType svelte setlocal foldmethod=indent
autocmd TermOpen * setlocal wrap nonumber norelativenumber filetype=terminal
autocmd FileType vim,startify,coc-explorer,terminal silent IndentLinesDisable
augroup END

" ================================================================================
" =                               KEY BINDINGS                                   =
" ================================================================================

" buffer next and buffer previous
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

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

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

" === Terminal Stuff ===
tnoremap <ESC><ESC> <C-\><C-n>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
