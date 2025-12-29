--[[ after/plugin.lspconfig ]]

require("mason").setup()

require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "pylsp",
        "rust_analyzer",
        "hls",
    },
}

local lspconfig = require "lspconfig"

lspconfig.lua_ls.setup {
    -- https://github.com/neovim/neovim/issues/21686#issuecomment-1522446128
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = {
                    "vim",
                    "require",
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
lspconfig.pylsp.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.hls.setup {}
