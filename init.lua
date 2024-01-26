--[[ init.lua ]]

local colorscheme = "catppuccin-mocha"

require("options")
require("keymaps")
require("plugins")

if not pcall(vim.cmd, "colorscheme " .. colorscheme) then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
end
