-- [[ plugins.lua ]]

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
