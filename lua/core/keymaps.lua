--[[ lua/core.keymaps ]]

local noremap = vim.keymap.set

-- Text manipulation --
-- Alt+vert movement moves the line
noremap("n", "<A-j>", ":m+1<CR>")
noremap("n", "<A-k>", ":m-2<CR>")
-- Alt+horiz movement moves characters within the line
noremap({"n", "v"}, "<A-h>", "xhP")
noremap({"n", "v"}, "<A-l>", "xlP")

-- LSP shortcuts --
-- gd uses LSP's goto-definition
noremap("n", "gd", "<C-w>]<C-w>j<C-w>q")
-- Shift-Tab does autocomplete
noremap("i", "<S-Tab>", "<C-x><C-o>")
-- Leader+dt toggles diagnostics
noremap("n", "<Leader>dt", function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)
-- Leader+dd shows the diagnostic pop-up
noremap("n", "<Leader>dd", vim.diagnostic.open_float)
-- Leader+dn goes to the next diagnostic
noremap("n", "<Leader>dn", vim.diagnostic.goto_next)
-- Leader+dp goes to the previous diagnostic
noremap("n", "<Leader>dp", vim.diagnostic.goto_prev)
-- Leader+da opens the code action menu
noremap("n", "<Leader>da", vim.lsp.buf.code_action)
