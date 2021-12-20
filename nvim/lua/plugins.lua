-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'nvim-lua/plenary.nvim' -- needed for many plugins
  use 'wbthomason/packer.nvim' -- Packer can manage itself
  use 'jiangmiao/auto-pairs' -- make brackets and quotes pair up
  use 'lewis6991/gitsigns.nvim' -- show git things in the gutter
  use 'tpope/vim-fugitive' -- more git stuff
  use { -- LSP things
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    'tami5/lspsaga.nvim'
  }
  use { -- auto complete things
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'ray-x/lsp_signature.nvim',
  }
  use {
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip'
  }
  use 'prettier/vim-prettier' -- pretier in vim
  use 'tpope/vim-commentary' -- better commenting
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- context sensitive commenting
  use 'ryanoasis/vim-devicons' -- icons
  use 'tpope/vim-surround' -- surround stuff in brackets
  use 'nvim-telescope/telescope.nvim' -- fuzzy finder
  use 'fannheyward/telescope-coc.nvim' -- coc support for telescope
  use 'mattn/emmet-vim' -- build html faster
  use 'lukas-reineke/indent-blankline.nvim' -- shows indentline even on blank lines
  use 'sheerun/vim-polyglot' -- support for lots of languages
  use 'windwp/nvim-ts-autotag' -- better html tags
  use 'ntpeters/vim-better-whitespace' -- highlight trailing whitespace
  -- use 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } -- markdown preview
  use 'glepnir/dashboard-nvim' -- startup screen
  use 'hoob3rt/lualine.nvim' -- status line
  use 'kyazdani42/nvim-web-devicons' -- more icons
  use 'romgrk/barbar.nvim' -- tabline
  use 'unblevable/quick-scope' -- shows how to jump to each word using t, f, T or F
  use 'sickill/vim-pasta' -- Better pasting in vim
  use 'rhysd/vim-clang-format' -- Formatting for c and cpp
  use 'christoomey/vim-tmux-navigator' -- allows c-[h, j, k, l] to work properly
  use 'ggandor/lightspeed.nvim' -- self descriptive
  use 'pantharshit00/vim-prisma' -- prisma file highlighting
  use 'sainnhe/gruvbox-material' -- great colorscheme
  use 'edkolev/tmuxline.vim' -- generate tmux status lines
  use 'alexlafroscia/postcss-syntax.vim' -- syntax for css and sass
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}  -- better syntax highlighting and stuff
  use { -- file tree
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-tree'.setup {} end
  }
  use 'mbbill/undotree' -- fancy looking undotree to visualize undo states
  use 'tveskag/nvim-blame-line' -- git blame in virtual text
  use 'karb94/neoscroll.nvim' -- smooth scrolling
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
  use 'onsails/lspkind-nvim'
end)
