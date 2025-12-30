--[[ after/plugin.lualine ]]

local function buffer_count()
    return #vim.fn.getbufinfo({buflisted = 1})
end

local function tab_count()
    return #vim.fn.gettabinfo()
end

local function tab_display()
    return "Tab " .. tostring(vim.fn.tabpagenr())
        .. "/" .. tostring(tab_count())
end

local function should_show_buffer_info()
    return buffer_count() > 1
end

local function should_show_tab_info()
    return tab_count() > 1
end

local function set_show_tabline(state)
    require("lualine").setup {options = {always_show_tabline = state}}
end

local function set_buffer_info(state)
    require("lualine").setup {
        tabline = {
            lualine_c = state and { "buffers" } or {},
        },
    }
    if state then set_show_tabline(true) end
end

local function set_tab_info(state)
    require("lualine").setup {
        tabline = {
            lualine_a = state and { tab_display } or {},
        },
    }
    if state then set_show_tabline(true) end
end

local function is_help_file(filename)
    return string.match(filename, "^/tmp/.+vim/runtime/doc/.+%.txt") ~= nil
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
                "TabEnter",
            },
        },
        always_show_tabline =
            should_show_tab_info() or should_show_buffer_info(),
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
    callback = function(ev)
        if is_help_file(ev.file) then
            return
        end
        set_buffer_info(true)
        set_show_tabline(true)
    end,
})
vim.api.nvim_create_autocmd({ "BufDelete" }, {
    pattern = { "*" },
    callback = function(ev)
        if is_help_file(ev.file) then
            return
        end
        if buffer_count() <= 2 then
            set_buffer_info(should_show_tab_info())
            set_show_tabline(should_show_tab_info())
        end
    end,
})

-- Only show tabs in the tabline if there are more than one
vim.api.nvim_create_autocmd({ "TabNew" }, {
    pattern = { "*" },
    callback = function()
        set_tab_info(true)
        set_buffer_info(true)
        set_show_tabline(true)
    end,
})
vim.api.nvim_create_autocmd({ "TabClosed" }, {
    pattern = { "*" },
    callback = function()
        if tab_count() == 1 then
            set_tab_info(false)
            set_buffer_info(should_show_buffer_info())
            set_show_tabline(should_show_buffer_info())
        end
    end,
})
