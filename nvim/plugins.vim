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
Plug 'lukas-reineke/indent-blankline.nvim' " shows indentline even on blank lines
Plug 'sheerun/vim-polyglot' " support for lots of languages
Plug 'AndrewRadev/tagalong.vim' " better html tags
Plug 'ntpeters/vim-better-whitespace' " highlight trailing whitespace
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " markdown preview
Plug 'glepnir/dashboard-nvim' " startup screen
Plug 'itchyny/lightline.vim' " statusline
Plug 'mengelbrecht/lightline-bufferline' " shows buffers in lightline
Plug 'unblevable/quick-scope' " shows how to jump to each word using t, f, T or F
Plug 'sickill/vim-pasta' " Better pasting in vim
Plug 'rhysd/vim-clang-format' " Formatting for c and cpp
Plug 'christoomey/vim-tmux-navigator' " allows c-[h, j, k, l] to work properly
Plug 'justinmk/vim-sneak' " easier easymotion
Plug 'josa42/vim-lightline-coc' " show coc stuff in lightline
Plug 'pantharshit00/vim-prisma' " prisma file highlighting
Plug 'sainnhe/gruvbox-material' " great colorscheme
Plug 'edkolev/tmuxline.vim' " generate tmux status lines
Plug 'alexlafroscia/postcss-syntax.vim' " syntax for css and sass
" fuzzy finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " better syntax highlighting and stuff
Plug 'tversteeg/registers.nvim' " make vim registers easier
Plug 'antoinemadec/coc-fzf' " Use fzf instead of coc's inbuilt fuzzy finder
call plug#end()
