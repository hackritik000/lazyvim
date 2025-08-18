-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.tsx" },
  callback = function()
    local file_path = vim.fn.expand("%:p")

    -- Correct way: pass cmd and args separately
    vim.fn.system({ "biome", "lint", "--fix", file_path })

    -- Optional: reload buffer after formatting
    vim.cmd("edit")
  end,
})
