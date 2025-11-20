-- [[ lua/core.keymaps.lua ]]

local noremap = vim.keymap.set

-- Workflow --
-- Leader+e opens the Netrw tree
noremap("n", "<leader>e", ":enew<CR>:Ntree<CR>")
-- Leader+t opens a terminal in new tab
noremap("n", "<leader>t", ":term<CR>i")

-- Navigation --
-- "/" searches for the highlighted text
noremap("v", "/", "y/\\V<C-r>\"<CR>")
-- center cursor onscreen for C-u/C-d
noremap("n", "<C-u>", "<C-u>zz")
noremap("n", "<C-d>", "<C-d>zz")
-- Ctrl+movement key navigates windows
noremap("n", "<C-h>", "<C-w>h")
noremap("n", "<C-j>", "<C-w>j")
noremap("n", "<C-k>", "<C-w>k")
noremap("n", "<C-l>", "<C-w>l")
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

-- Text manipulation --
-- Alt+vert movement moves line
noremap("n", "<A-j>", ":m+1<CR>")
noremap("n", "<A-k>", ":m-2<CR>")
-- Alt+horiz movement moves characters within line
noremap({"n", "v"}, "<A-h>", "xhP")
noremap({"n", "v"}, "<A-l>", "xlP")
-- Ctrl-n operates on selected lines
noremap("v", "<C-n>", ":norm ")

-- LSP shortcuts --
-- gd uses LSP's goto-definition
noremap("n", "gd", "<C-w>]<C-w>j<C-w>q")
-- Shift-Tab does autocomplete
noremap("i", "<S-Tab>", "<C-x><C-o>")
-- Leader+dt toggles diagnostics
noremap("n", "<leader>dt", function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end)
-- Leader+dd shows the diagnostic pop-up
noremap("n", "<leader>dd", vim.diagnostic.open_float)
-- Leader+dn goes to the next diagnostic
noremap("n", "<leader>dn", vim.diagnostic.goto_next)
-- Leader+dp goes to the previous diagnostic
noremap("n", "<leader>dp", vim.diagnostic.goto_prev)
-- Leader+da opens the code action menu
noremap("n", "<leader>da", vim.lsp.buf.code_action)
