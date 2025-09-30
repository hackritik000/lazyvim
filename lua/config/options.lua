vim.g.root_spec = { ".git" }

-- Auto-run Biome on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.js", "*.ts", "*.tsx", "*.jsx", "*.json" }, -- adjust as needed
  callback = function()
    vim.cmd("silent !biome check --write %")
    vim.cmd("edit!") -- reload file after Biome changes
  end,
})
