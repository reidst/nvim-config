-- [[ lua/core.options.lua ]]

local g = vim.g
local opt = vim.opt

g.mapleader = " "
g.localleader = "\\"

-- Context
-- opt.cursorline = true
opt.number = true
-- opt.relativenumber = true
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
opt.hlsearch = false
opt.incsearch = true

-- Whitespace
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.smartindent = true
