-- ==============================================================================
-- =                                EDITOR OPTIONS                              =
-- ==============================================================================

-- Keep undos even after reboots
vim.o.undofile = true

-- makes everything snappier
vim.o.updatetime = 50

-- nicer colors
vim.o.termguicolors = true

-- Use space as leader
nmap("<Space>", "<Nop>")
vim.g.mapleader = " "

-- don't *really* close buffers
vim.o.hidden = true

-- allow all things using mouse
vim.o.mouse = "a"

vim.o.showtabline = 2

vim.o.ttimeoutlen = 1 -- make key presses show up faster
-- show line numbers
vim.o.number = true
vim.o.relativenumber = true

vim.o.clipboard = vim.o.clipboard .. "unnamedplus" -- use system clipboard
vim.o.shortmess = vim.o.shortmess .. "c" -- better completion menu
vim.o.signcolumn = "auto" -- only show signcolumn when there are things to show
vim.o.tabstop = 2 -- Use two space tab
vim.o.shiftwidth =2 -- Indentation amount for > and < commands
vim.o.expandtab = true -- convert tab to spaces
vim.o.encoding="utf-8" -- Use utf-8
vim.o.textwidth=80 -- 80 chars in a line

vim.o.foldcolumn="1" -- defines 1 col at window left, to indicate folding

-- case options
vim.o.smartcase = true
vim.o.ignorecase = true

-- don't highlight search results after searching
vim.o.hlsearch = false

-- correct splits
vim.o.splitbelow = true
vim.o.splitright = true

vim.o.backspace='eol,start' -- make backspace act like it normally does
vim.o.shell='bash' -- use bash as shell because fish breaks a lot of plugins
