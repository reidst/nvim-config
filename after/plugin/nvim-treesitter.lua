--[[ after/plugin.nvim-treesitter ]]

require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "vimdoc",
        "python",
        "rust",
    },
    ignore_install = {},
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,
    },
    additional_vim_regex_highlighting = false,
    modules = {},
}
