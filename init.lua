--[[ lua/init.lua ]]

require "core"

local colorscheme = "kanagawa"

if not pcall(function () vim.cmd("colorscheme " .. colorscheme) end) then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
end
