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
