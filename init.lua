--[[ init.lua ]]

local g = vim.g
local opt = vim.opt
local noremap = vim.keymap.set
local colorscheme = "catppuccin-mocha"
local filetree_cmd = "NvimTreeToggle"

--[[ LEADER ]]

g.mapleader = " "
g.localleader = "\\"

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

--[[ OPTIONS ]]

-- Context
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4
opt.scrolloff = 4
opt.laststatus = 3
opt.wrap = false

-- Filetypes
opt.encoding = "utf8"
opt.fileencoding = "utf8"

-- Theme
opt.syntax = "ON"
opt.termguicolors = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Whitespace
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.smartindent = true

--[[ KEYMAPS ]]

-- Leader+t opens a terminal in new tab
noremap("n", "<leader>t", ":term<CR>i")
-- Escape exits terminal mode
noremap("t", "<ESC>", "<C-\\><C-n>")
-- Leader+s opens nvim config
noremap("n", "<leader>s", ":e ~/.config/nvim/init.lua<CR>")
-- Leader+ft opens file tree
noremap("n", "<leader>ft", ":" .. filetree_cmd .. "<CR>")
-- "jk" enters normal mode
noremap("i", "jk", "<ESC>")
noremap("v", "jk", "<ESC>")
-- Ctrl+a selects all
noremap("n", "<C-a>", "ggVG$v")
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
noremap("v", "<C-n>", ":norm^") -- https://stackoverflow.com/a/23063140

--[[ PLUGINS ]]

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Themes
    "nvim-tree/nvim-web-devicons",
    { "askfiy/visual_studio_code", lazy = true },
    { "morhetz/gruvbox", lazy = true },
    { "rebelot/kanagawa.nvim",
        lazy = true,
        config = function()
            require("kanagawa").setup({compile = true})
	    end,
    },
    "catppuccin/nvim",
    -- Files
    { "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup()
        end,
    },
    -- Statusline
    { "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                globalstatus = true,
            })
        end,
    },
    -- Shortcuts
    "tpope/vim-commentary",
    -- Languages
    "hasufell/ghcup.vim",
    "rbgrouleff/bclose.vim",
})

if not pcall(vim.cmd, "colorscheme " .. colorscheme) then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
end
