-- ================================================================================
-- =                               KEY BINDINGS                                   =
-- ================================================================================

-- j/k will move virtual lines (lines that wrap)
nmap("<silent>", "<expr> j (v:count == 0 ? 'gj' : 'j'")
nmap("<silent>", "<expr> k (v:count == 0 ? 'gk' : 'k'")


-- buffer next and buffer previous
nmap("<leader>bn", ":BufferNext<CR>")
nmap("<leader>bp", ":BufferPrevious<CR>")

nmap("<leader>bw", ":BufferWipe<CR>")
nmap("<leader>bd", ":BufferDelete<CR>")

nmap("<leader>tf", ":lua require('tree').toggle()<CR>")

nmap("<Leader>ss", ":<C-u>SessionSave<CR>")
nmap("<Leader>sl",  ":<C-u>SessionLoad<CR>")
nmap("<Leader>fh", ":DashboardFindHistory<CR>")
nmap("<Leader>ff", ":DashboardFindFile<CR>")
nmap("<Leader>tc", ":DashboardChangeColorschem)e<CR>")
nmap("<Leader>fa", ":DashboardFindWord<CR>")
nmap("<Leader>fb", ":DashboardJumpMark<CR>")
nmap("<Leader>cn", ":DashboardNewFile<CR>")
nmap("<Leader>fl", ":Telescope current_buffer_fuzzy_find<CR>")

-- " Move around easier
-- function! WinMove(key)
--     let t:curwin = winnr()
--     exec "wincmd ".a:key
--     if (t:curwin == winnr())
--         if (match(a:key,'[jk]'))
--             wincmd v
--         else
--             wincmd s
--         endif
--         exec "wincmd ".a:key
--     endif
-- endfunction

-- nnoremap <silent> <C-h> :call WinMove('h')<CR>
-- nnoremap <silent> <C-j> :call WinMove('j')<CR>
-- nnoremap <silent> <C-k> :call WinMove('k')<CR>
-- nnoremap <silent> <C-l> :call WinMove('l')<CR>

-- === LSP ===

nmap("<a-s>", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
vmap("<a-s>", ":<C-u>lua require('lspsaga.codeaction').range_code_action()<CR>")

nmap("K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")

nmap("]g", "<cmd>Lspsaga diagnostic_jump_next<CR>")
nmap("[g", "<cmd>Lspsaga diagnostic_jump_prev<CR>")

nmap("<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
nmap("<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")

nmap("<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>")

-- === Terminal Stuff ===
map("t", "<ESC><ESC>", "<C-\\><C-n>")
map("t", "<C-h>", "<C-\\><C-N><C-w>h" )
map("t", "<C-j>", "<C-\\><C-N><C-w>j" )
map("t", "<C-k>", "<C-\\><C-N><C-w>k" )
map("t", "<C-l>", "<C-\\><C-N><C-w>l" )

-- === Undo tree ===
nmap("<F5>", ":UndotreeToggle<CR>")
