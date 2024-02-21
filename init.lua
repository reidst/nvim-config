--[[ init.lua ]]

require("custom")

local colorscheme = "catppuccin-mocha"

if not pcall(vim.cmd, "colorscheme " .. colorscheme) then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
end
