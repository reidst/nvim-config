-- [[ custom.keymaps.lua ]]

local noremap = vim.keymap.set

local hide_bg = function ()
    if vim.opt.cursorline._value then
        vim.cmd [[
                hi Normal guibg=none
                hi NormalNC guibg=none
                hi WinSeparator guifg=#303446
                hi lualine_c_normal guibg=none
                hi lualine_c_inactive guibg=none
        ]]
        vim.opt.cursorline = false
    else
        local colorscheme = vim.g.colors_name
        vim.cmd("colorscheme " .. colorscheme)
        vim.opt.cursorline = true
    end
end

-- Leader+t opens a terminal in new tab
noremap("n", "<leader>t", ":term<CR>i")
-- Escape exits terminal mode
noremap("t", "<ESC>", "<C-\\><C-n>")
-- Leader+s opens nvim config
noremap("n", "<leader>s", ":e ~/.config/nvim/init.lua<CR>")
-- Leader+bg makes the background transparent
noremap("n", "<leader>bg", hide_bg)
-- "jk" enters normal mode
noremap("i", "jk", "<ESC>")
noremap("v", "jk", "<ESC>")
-- Ctrl+a selects all
noremap("n", "<C-a>", "ggVG$v")
-- Ctrl+c copies to system clipboard
noremap("v", "<C-c>", "\"+y")
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
