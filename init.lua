--[[ init.lua ]]

local g = vim.g
local opt = vim.opt
local map = function(a, b, c) vim.api.nvim_set_keymap(a, b, c, {}) end
local noremap = vim.keymap.set
local Plug = vim.fn["plug#"]
local colorscheme = "visual_studio_code"

--[[ LEADER ]]

g.mapleader = " "
g.localleader = "\\"

-- g.t_co = 256
-- g.background = 'dark'

--[[ OPTIONS ]]

-- Context
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4
opt.scrolloff = 4

-- Filetypes
opt.encoding = "utf8"
opt.fileencoding = "utf8"

-- Theme
opt.syntax = "ON"
opt.termguicolors = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Whitespace
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4

--[[ KEYMAPS ]]

-- Leader+t opens a terminal in new tab
map("n", "<leader>t", ":term<CR>i")
-- Leader+s opens nvim config
map("n", "<leader>s", ":e ~/.config/nvim/init.lua<CR>")
-- "jk" enters normal mode
map("i", "jk", "<esc>")
map("v", "jk", "<esc>")
map("t", "jk", "<C-\\><C-n>")
-- Ctrl+a selects all
map("n", "<C-a>", "ggVG$v")
-- Ctrl+movement key navigates windows
noremap("n", "<C-h>", "<C-w>h")
noremap("n", "<C-j>", "<C-w>j")
noremap("n", "<C-k>", "<C-w>k")
noremap("n", "<C-l>", "<C-w>l")
-- Alt+vert movement moves line
noremap("n", "<A-j>", "Vyddp")
map("n", "<A-k>", "k<A-j>k")
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
noremap("v", "<C-n>", ":norm^") -- https://stackoverflow.com/a/23063140

--[[ PLUGINS ]]

vim.call("plug#begin")
-- Themes
Plug "askfiy/visual_studio_code"
Plug "morhetz/gruvbox"
-- Files/Data
Plug "preservim/nerdtree"
-- Shortcuts
Plug "tpope/vim-commentary"
vim.call("plug#end")
-- Languages
Plug "hasufell/ghcup.vim"
Plug "rbgrouleff/bclose.vim"

if not pcall(vim.cmd, "colorscheme " .. colorscheme) then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
end
