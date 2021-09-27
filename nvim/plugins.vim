call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive' " git extension
Plug 'jiangmiao/auto-pairs' " make brackets and quotes pair up
Plug 'airblade/vim-gitgutter' " show git info in the gutter
Plug 'tpope/vim-commentary' " better commenting
Plug 'neoclide/coc.nvim', { 'branch': 'release' } " autocomplete
Plug 'JoosepAlviste/nvim-ts-context-commentstring' " context sensitive commenting
Plug 'ryanoasis/vim-devicons' " icons
Plug 'tpope/vim-surround' " surround stuff in brackets
Plug 'nvim-lua/plenary.nvim' " needed for ↓
Plug 'nvim-telescope/telescope.nvim' " fuzzy finder
Plug 'fannheyward/telescope-coc.nvim' " coc support for telescope
Plug 'mattn/emmet-vim' " build html faster
Plug 'lukas-reineke/indent-blankline.nvim' " shows indentline even on blank lines
Plug 'sheerun/vim-polyglot' " support for lots of languages
Plug 'windwp/nvim-ts-autotag' " better html tags
Plug 'ntpeters/vim-better-whitespace' " highlight trailing whitespace
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " markdown preview
Plug 'glepnir/dashboard-nvim' " startup screen
Plug 'hoob3rt/lualine.nvim' " status line
Plug 'kyazdani42/nvim-web-devicons' " more icons
Plug 'romgrk/barbar.nvim' " tabline
Plug 'unblevable/quick-scope' " shows how to jump to each word using t, f, T or F
Plug 'sickill/vim-pasta' " Better pasting in vim
Plug 'rhysd/vim-clang-format' " Formatting for c and cpp
Plug 'christoomey/vim-tmux-navigator' " allows c-[h, j, k, l] to work properly
Plug 'justinmk/vim-sneak' " easier easymotion
Plug 'pantharshit00/vim-prisma' " prisma file highlighting
Plug 'sainnhe/gruvbox-material' " great colorscheme
Plug 'edkolev/tmuxline.vim' " generate tmux status lines
Plug 'alexlafroscia/postcss-syntax.vim' " syntax for css and sass
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " better syntax highlighting and stuff
Plug 'kyazdani42/nvim-tree.lua' " file tree
Plug 'rafamadriz/friendly-snippets' " snippets for above
Plug 'mbbill/undotree' " fancy looking undotree to visualize undo states
Plug 'tveskag/nvim-blame-line' " git blame in virtual text
Plug 'karb94/neoscroll.nvim' " smooth scrolling
call plug#end()
