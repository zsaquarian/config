call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive' " git extension
Plug 'jiangmiao/auto-pairs' " make brackets and quotes pair up
Plug 'airblade/vim-gitgutter' " show git info in the gutter
Plug 'tpope/vim-commentary' " better commenting
Plug 'ryanoasis/vim-devicons' " icons
Plug 'neoclide/coc.nvim', { 'branch': 'release' } " auto complete
Plug 'tpope/vim-surround' " surround stuff in brackets
Plug 'habamax/vim-godot' " godot support
Plug 'mattn/emmet-vim' " build html faster
Plug 'Yggdroot/indentLine' " shows line on indents
Plug 'lukas-reineke/indent-blankline.nvim' " shows indentline even on blank lines
Plug 'sheerun/vim-polyglot' " support for lots of languages
Plug 'AndrewRadev/tagalong.vim' " better tags
Plug 'ntpeters/vim-better-whitespace' " highlight trailing whitespace
Plug 'Shougo/neosnippet' " snippet engine
Plug 'Shougo/neosnippet-snippets' " snippets for snippet engine
Plug 'Shougo/echodoc.vim' " show autocomplete info in echo area
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " markdown preview
Plug 'mhinz/vim-startify' " startup screen
Plug 'itchyny/lightline.vim' " statusline
Plug 'mengelbrecht/lightline-bufferline' " shows buffers in lightline
Plug 'unblevable/quick-scope' " shows how to jump to each word using t, f, T or F
Plug 'liuchengxu/vista.vim' " tags!
Plug 'sickill/vim-pasta' " Better pasting in vim
Plug 'rhysd/vim-clang-format' " Formatting for c and cpp
" Fuzzy finding!
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator' " allows c-[h, j, k, l] to work properly
Plug 'srcery-colors/srcery-vim' " great colorscheme
Plug 'APZelos/blamer.nvim' " git blame!
Plug 'justinmk/vim-sneak' " easier easymotion
Plug 'josa42/vim-lightline-coc' " show coc stuff in lightline
Plug 'michaelb/sniprun', {'do': 'bash install.sh'} " run code
Plug 'pantharshit00/vim-prisma' 
call plug#end()
