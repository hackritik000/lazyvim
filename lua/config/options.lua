-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.ts", "*.tsx" },
--   callback = function()
--     vim.lsp.buf.code_action({
--       context = { only = { "source.organizeImports" } },
--       apply = true,
--     })
--
--     local file_path = vim.fn.expand("%:p")
--
--     vim.fn.system({ "biome", "lint", "--fix", file_path })
--   end,
-- })

vim.g.root_spec = { ".git" }
