--[[ lua/core.vimrc ]]

vim.cmd [[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
exe 'source '.stdpath('config').'/vim/.vimrc'
]]
