source ~/.config/nvim/plugins.vim " Plugins!

" ==============================================================================
" =                                EDITOR OPTIONS                              =
" ==============================================================================

" makes everything snappier
set updatetime=50
" Use space as leader
nnoremap <SPACE> <Nop>
let g:mapleader="\<Space>"

set ttimeoutlen=1 " make key presses show up faster
set number relativenumber " show line numbers

set clipboard=unnamed " use system clipboard
set shortmess+=c " better completion menu
set signcolumn=auto " only show signcolumn when there are things to show
set tabstop=2 " Use two space tab
set shiftwidth=2 " Indentation amount for > and < commands
set expandtab " convert tab to spaces
set encoding=utf-8 " Use utf-8

" folding
set foldmethod=syntax " syntax highlighting items specify folds
set foldcolumn=1 " defines 1 col at window left, to indicate folding
let javaScript_fold=1 " activate folding by JS syntax
set foldlevelstart=0 " start file with all folds closed

" rainbow brackets
let g:rainbow_active = 1
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'blue', 'green']

" nice indentline
let g:indentLine_char = '▏'

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

" === LeaderF setup ==="
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\u203a", 'right': "\u2029", 'font': "Hurmit NF Medium" }
let g:Lf_PreviewResult = { 'Function': 0 }
let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>bb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

syntax on " switch on syntax highlighting

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" === NERDTree settings ====

let g:NERDTreeMinimalUI = 1 " Remove bookmarks and help text from NERDTree

" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'

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
  return &readonly && &filetype !~# '\v(help|nerdtree)' ? 'RO' : ''
endfunction

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'modified', 'buffers'  ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'readonly': 'LightlineReadonly'
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

augroup filetype_nerdtree
    au!
    au FileType nerdtree call s:disable_lightline_on_nerdtree()
    au WinEnter,BufWinEnter,TabEnter * call s:disable_lightline_on_nerdtree()
augroup END

" tell lightline to not show in nerdtree
fu s:disable_lightline_on_nerdtree() abort
    let nerdtree_winnr = index(map(range(1, winnr('$')), {_,v -> getbufvar(winbufnr(v), '&ft')}), 'nerdtree') + 1
    call timer_start(0, {-> nerdtree_winnr && setwinvar(nerdtree_winnr, '&stl', '%#Normal#')})
endfu

" === Vista ===
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

let g:vista_default_executive = 'coc'

nnoremap <silent> <leader>t :Vista!

" Emmet setup
let g:user_emmet_leader_key = ','

" startify setup
let g:startify_custom_header = [
            \ '                                 ________  __ __',
            \ '            __                  /\_____  \/\ \\ \',
            \ '    __  __ /\_\    ___ ___      \/___//''/''\ \ \\ \',
            \ '   /\ \/\ \\/\ \ /'' __` __`\        /'' /''  \ \ \\ \_',
            \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \      /'' /''__  \ \__ ,__\',
            \ '    \ \___/  \ \_\ \_\ \_\ \_\    /\_/ /\_\  \/_/\_\_/',
            \ '     \/__/    \/_/\/_/\/_/\/_/    \//  \/_/     \/_/',
            \ ]

" ================================================================================
" =                                      UI                                      =
" ================================================================================

set noshowmode " dont show mode in command area (airline already shows it)
colo base16-gruvbox-dark-hard " set backup colorscheme
set winbl=10 " make floating windows slightly transparent
" cursor shapes
let &t_SI = "\e[6 q"
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


if has('gui_running')
	" Set font to hurmit if gui is running
	set guifont=Hurmit\ NF:h14
endif

let base16colorspace=256

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Optionally reset the cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
autocmd VimEnter * silent hi Comment cterm=italic gui=italic
autocmd VimEnter * silent hi Normal guibg=NONE ctermbg=NONE
augroup END

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Vim run
let g:run_cmd_python = ['python3'] " run python files with python3

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

" === Nerdtree shorcuts === "
"  <leader>n - Toggle NERDTree on/off
"  <leader>ft - Find current file in NERDTree
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>ft :NERDTreeFind<CR>

" === COC shortcuts === "

imap <a-cr> <esc><Plug>(coc-codeaction-cursor)a
nmap <a-cr> <Plug>(coc-codeaction-cursor)
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

" closes nvim if nerdtree is the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
