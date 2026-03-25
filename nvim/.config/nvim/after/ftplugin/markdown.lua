-- These are 'window-local' options, hence 'wo'
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Optional: Start with everything unfolded 
-- So you don't open a file and see only one line
vim.wo.foldlevel = 99

