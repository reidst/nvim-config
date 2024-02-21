-- [[ custom.plugins.lua ]]

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
    { "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup {
                globalstatus = true,
                options = {
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_a = { "branch" },
                    lualine_b = { "diff", "diagnostics" },
                    lualine_c = { "buffers" },
                    lualine_x = {},
                },
            }
        end,
    },
    -- Themes
    "nvim-tree/nvim-web-devicons",
    { "askfiy/visual_studio_code", lazy = true },
    { "morhetz/gruvbox", lazy = true },
    { "rebelot/kanagawa.nvim",
        lazy = true,
        config = function()
            require("kanagawa").setup {compile = true}
        end,
    },
    { "catppuccin/nvim", lazy = true },
    { "rose-pine/neovim", lazy = true },
}

-- LSP config
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "pylsp",
        "rust_analyzer",
    },
}
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup {}
lspconfig.pylsp.setup {}
lspconfig.rust_analyzer.setup {}
