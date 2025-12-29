--[[ after/plugin.haskell-vim ]]

local g = vim.g

vim.cmd [[
syntax on
filetype plugin indent on
]]

--[[ Highlighting ]]

g.haskell_enable_quantification = 1   -- to enable highlighting of `forall`
g.haskell_enable_recursivedo = 0      -- to enable highlighting of `mdo` and `rec`
g.haskell_enable_arrowsyntax = 0      -- to enable highlighting of `proc`
g.haskell_enable_pattern_synonyms = 1 -- to enable highlighting of `pattern`
g.haskell_enable_typeroles = 1        -- to enable highlighting of type roles
g.haskell_enable_static_pointers = 0  -- to enable highlighting of `static`
g.haskell_backpack = 0                -- to enable highlighting of backpack keywords

g.haskell_classic_highlighting = 0    -- a more traditional highlighting mode

g.haskell_disable_TH = 0              -- disables Template Haskell and Quasiquoting syntax

--[[ Indentation ]]

g.haskell_indent_disable = 1          -- disables indentation

-- if bool
-- >>>then ...
-- >>>else ...
g.haskell_indent_if = 3
-- case xs of
-- >>[]     -> ...
-- >>(y:ys) -> ...
g.haskell_indent_case = 2
-- let x = 0 in
-- >>>>x
g.haskell_indent_let = 4
-- where f :: Int -> Int
-- >>>>>>f x = x
g.haskell_indent_where = 6
-- foo
-- >>where
g.haskell_indent_before_where = 2
-- where
-- >>foo
g.haskell_indent_after_bare_where = 2
-- do x <- a
-- >>>y <- b
g.haskell_indent_do = 3
-- let x = 1
-- >in x
g.haskell_indent_in = 1
-- f x y
-- >>|
g.haskell_indent_guard = 2
