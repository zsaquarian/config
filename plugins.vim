call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive' " git extension
Plug 'preservim/nerdtree' " file tree
Plug 'jiangmiao/auto-pairs' " make brackets and quotes pair up
Plug 'airblade/vim-gitgutter' " show git info in the gutter
Plug 'tpope/vim-commentary' " better commenting
Plug 'ryanoasis/vim-devicons' " icons
Plug 'neoclide/coc.nvim', { 'branch': 'release' } " auto complete
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " multiple cursors
Plug 'tpope/vim-surround' " surround stuff in brackets
Plug 'habamax/vim-godot' " godot support
Plug 'mattn/emmet-vim' " build html faster
Plug 'Yggdroot/indentLine' " shows line on indents
Plug 'sheerun/vim-polyglot' " support for lots of languages
Plug 'AndrewRadev/tagalong.vim' " better tags
Plug 'vim-airline/vim-airline-themes' " themes for airline
Plug 'chriskempson/base16-vim' " MORE COLORSCHEMES!
Plug 'jparise/vim-graphql' " graphql support
Plug 'ntpeters/vim-better-whitespace' " highlight trailing whitespace
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'Shougo/neosnippet' " snippet engine
Plug 'Shougo/neosnippet-snippets' " snippets for snippet engine
Plug 'Shougo/echodoc.vim' " show autocomplete info in echo area
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " syntax highlight files in nerdtree
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " markdown preview
Plug 'sbdchd/vim-run' " Run files
Plug 'frazrepo/vim-rainbow' " rainbow brackets make code easier to read
Plug 'mhinz/vim-startify' " startup screen
Plug 'dbeniamine/cheat.sh-vim' " stack overflow in vim
Plug 'itchyny/lightline.vim' " statusline
Plug 'mengelbrecht/lightline-bufferline' " shows buffers in lightline
Plug 'unblevable/quick-scope' " shows how to jump to each word using t, f, T or F
Plug 'liuchengxu/vista.vim' " tags!
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()
