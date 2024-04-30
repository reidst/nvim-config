-- [[ lua/core.plugins.lua ]]

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
    -- LSP
    "nvim-treesitter/nvim-treesitter",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    -- Languages
    "hasufell/ghcup.vim",
    "rbgrouleff/bclose.vim",
    -- Shortcuts
    "tpope/vim-commentary",
    -- Statusline
    "nvim-lualine/lualine.nvim",
    -- Themes
    "nvim-tree/nvim-web-devicons",
    { "askfiy/visual_studio_code", lazy = true },
    { "morhetz/gruvbox", lazy = true },
    { "rebelot/kanagawa.nvim", lazy = true },
    { "catppuccin/nvim", lazy = true },
    { "rose-pine/neovim", lazy = true },
}
