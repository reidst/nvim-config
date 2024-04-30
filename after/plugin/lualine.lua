--[[ after/plugin/lualine.lua ]]

require("lualine").setup {
    globalstatus = true,
    options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = { "branch" },
        lualine_b = { "diff", "diagnostics" },
        lualine_c = { "buffers" },
        lualine_x = {},
    },
}
