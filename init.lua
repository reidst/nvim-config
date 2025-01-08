--[[ lua/init.lua ]]

require "core"

local colorscheme = "enfocado"
local transparent = true

if not pcall(function () vim.cmd("colorscheme " .. colorscheme) end) then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
end

if transparent then
  vim.cmd "hi Normal guibg=None"
  vim.cmd "hi NormalNC guibg=None"
end
