--[[ after/plugin.lualine ]]

local function buffer_count()
    return vim.api.nvim_eval("len(getbufinfo({'buflisted':1}))")
end

require("lualine").setup {
    globalstatus = true,
    options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        refresh = {
            events = {
                "BufAdd",
                "BufDelete",
            },
        },
    },
    sections = {
        lualine_a = { "branch" },
        lualine_b = { "diff", "diagnostics" },
        lualine_c = { "filename", "filetype" },
        lualine_x = { "encoding", "fileformat" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = buffer_count() > 1 and { "buffers" } or {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
}

-- Only show buffers in the winbar if there are more than one
vim.api.nvim_create_autocmd({ "BufAdd" }, {
    pattern = { "*" },
    callback = function()
        if buffer_count() > 1 then
            require("lualine").setup {winbar = {lualine_c = { "buffers" }}}
        end
    end
})
vim.api.nvim_create_autocmd({ "BufDelete" }, {
    pattern = { "*" },
    callback = function()
        if buffer_count() == 2 then
            require("lualine").setup {winbar = {lualine_c = {}}}
        end
    end,
})
