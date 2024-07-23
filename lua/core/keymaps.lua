-- [[ lua/core.keymaps.lua ]]

local noremap = vim.keymap.set

-- Leader+n opens the Netrw tree
noremap("n", "<leader>n", ":enew<CR>:Ntree<CR>")
-- Leader+t opens a terminal in new tab
noremap("n", "<leader>t", ":term<CR>i")
-- Escape exits terminal mode
-- noremap("t", "<ESC>", "<C-\\><C-n>")
-- center cursor onscreen for C-u/C-d
noremap("n", "<C-u>", "<C-u>zz")
noremap("n", "<C-d>", "<C-d>zz")
-- Ctrl+movement key navigates windows
noremap("n", "<C-h>", "<C-w>h")
noremap("n", "<C-j>", "<C-w>j")
noremap("n", "<C-k>", "<C-w>k")
noremap("n", "<C-l>", "<C-w>l")
-- Alt+vert movement moves line
noremap("n", "<A-j>", ":m+1<CR>")
noremap("n", "<A-k>", ":m-2<CR>")
-- "[b" and "]b" navigate buffers
noremap("n", "[b", ":bp<CR>")
noremap("n", "]b", ":bn<CR>")
noremap("n", "[B", ":bf<CR>")
noremap("n", "]B", ":bl<CR>")
-- "[t" and "]t" navigate tabs
noremap("n", "[t", ":tabprev<CR>")
noremap("n", "]t", ":tabnext<CR>")
noremap("n", "[T", ":tabfirst<CR>")
noremap("n", "]T", ":tablast<CR>")
-- "[a" and "]a" navigate argfiles
noremap("n", "[a", ":prev<CR>")
noremap("n", "]a", ":next<CR>")
noremap("n", "[A", ":first<CR>")
noremap("n", "]A", ":last<CR>")
-- Ctrl-n operates on selected lines
noremap("v", "<C-n>", ":norm ") -- https://stackoverflow.com/a/23063140
