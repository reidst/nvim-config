--[[ after/plugin.lualine ]]

local function buffer_count()
    return vim.api.nvim_eval("len(getbufinfo({'buflisted':1}))")
end

local function tab_count()
    return vim.api.nvim_eval("len(gettabinfo())")
end

local function tabs()
    local current_tab = tostring(vim.api.nvim_eval "tabpagenr()")
    return "Tab " .. current_tab .. "/" .. tostring(tab_count())
end

local function show_tabline(state)
    require("lualine").setup {options = {always_show_tabline = state ~= false}}
end

local hide_tabline = function() show_tabline(false) end

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
        always_show_tabline = buffer_count() > 1,
    },
    sections = {
        lualine_a = { "branch" },
        lualine_b = { "diff", "diagnostics" },
        lualine_c = { "filename", "filetype" },
        lualine_x = { "encoding", "fileformat" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    tabline = {
        lualine_a = tab_count() > 1 and { tabs } or {},
        lualine_b = {},
        lualine_c = buffer_count() > 1 and { "buffers" } or {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
}

-- Only show buffers in the tabline if there are more than one
vim.api.nvim_create_autocmd({ "BufAdd" }, {
    pattern = { "*" },
    callback = function()
        if buffer_count() > 1 then
            show_tabline()
            require("lualine").setup {
                tabline = {lualine_c = { "buffers" }},
            }
        else
            require("lualine").setup {
                tabline = {lualine_c = {}},
            }
        end
    end,
})
vim.api.nvim_create_autocmd({ "BufDelete" }, {
    pattern = { "*" },
    callback = function()
        if buffer_count() <= 2 then
            hide_tabline()
            require("lualine").setup {
                tabline = {lualine_c = {}},
            }
        else
            require("lualine").setup {
                tabline = {lualine_c = { "buffers" }},
            }
        end
    end,
})

-- Only show tabs in the tabline if there are more than one
vim.api.nvim_create_autocmd({ "TabNew" }, {
    pattern = { "*" },
    callback = function()
        if tab_count() > 1 then
            show_tabline()
            require("lualine").setup {
                tabline = {lualine_a = { tabs }},
            }
        else
            require("lualine").setup {
                tabline = {lualine_a = {}},
            }
        end
    end,
})
vim.api.nvim_create_autocmd({ "TabClosed" }, {
    pattern = { "*" },
    callback = function()
        if tab_count() == 1 then
            hide_tabline()
            require("lualine").setup {
                tabline = {lualine_a = {}},
            }
        else
            require("lualine").setup {
                tabline = {lualine_a = { tabs }},
            }
        end
    end,
})
