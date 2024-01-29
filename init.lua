--[[ init.lua ]]

local colorscheme = "catppuccin-mocha"

require("user.options")
require("user.keymaps")
require("user.plugins")

if not pcall(vim.cmd, "colorscheme " .. colorscheme) then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
end
