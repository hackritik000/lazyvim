-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- First, remove default Flash mapping
vim.keymap.del("n", "s")
vim.keymap.del("x", "s")

-- Then, assign Flash to another key
vim.keymap.set("n", "<leader>s", function()
  require("flash").jump()
end, { desc = "Flash jump" })

vim.keymap.set("v", "<leader>s", function()
  require("flash").jump({ search = { mode = "search" } })
end, { desc = "Flash jump in visual" })

vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Force quit insert mode" })

vim.keymap.set("i", "<C-l>", function()
  require("blink-cmp").show()
end, { desc = "Show LSP" })

-- Biome on save
vim.keymap.set("n", "<leader>cb", function()
  local file_path = vim.fn.expand("%:p")
  if vim.fn.filereadable(file_path) == 0 then
    vim.notify("File not readable: " .. file_path, vim.log.levels.WARN)
    return
  end

  -- Run with output capture (non-silent for debugging)
  local cmd = { "biome", "check", "--write", file_path }
  local result = vim.system(cmd, { cwd = vim.fn.getcwd() }):wait() -- Uses project cwd

  if result.code ~= 0 then
    vim.notify(
      "Biome failed (code " .. result.code .. "):\n" .. (result.stdout or result.stderr or "No output"),
      vim.log.levels.ERROR
    )
  else
    vim.notify("Biome success: " .. (result.stdout or "Fixed!"), vim.log.levels.INFO)
  end

  vim.cmd("edit!") -- Reload
end, { desc = "Format with Biome" })
