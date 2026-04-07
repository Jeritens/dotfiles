vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldlevel = 99

-- vim.api.nvim_create_autocmd({ "BufReadPost", "BufWinEnter" }, {
--   pattern = "*.md",
--   callback = function()
    -- vim.schedule(function()
      -- Force fold update
      -- vim.cmd("normal! zx")
      -- If line 1 starts with '---', close that fold (the frontmatter)
      -- if vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]:match("^---") then
      --   vim.cmd("1foldclose")
      -- end
    -- end)
  -- end,
-- })
