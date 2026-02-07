return {
  "jbyuki/venn.nvim",

  -- lazy-load when needed (recommended)
  cmd = { "VBox", "VLine", "VBoxClear" },

  keys = {
    -- optional: only load when you press the toggle mapping
    { "<leader>v", desc = "Toggle Venn mode" },
  },

  config = function()
    -- Your toggle function (slightly cleaned up + modernized)
    local function toggle_venn()
      local venn_enabled = vim.b.venn_enabled

      if not venn_enabled then
        vim.b.venn_enabled = true
        vim.opt_local.virtualedit = "all"

        -- draw line with HJKL in normal mode
        vim.keymap.set("n", "J", "<C-v>j:VBox<CR>", { buffer = true, noremap = true, desc = "Draw down" })
        vim.keymap.set("n", "K", "<C-v>k:VBox<CR>", { buffer = true, noremap = true, desc = "Draw up" })
        vim.keymap.set("n", "L", "<C-v>l:VBox<CR>", { buffer = true, noremap = true, desc = "Draw right" })
        vim.keymap.set("n", "H", "<C-v>h:VBox<CR>", { buffer = true, noremap = true, desc = "Draw left" })

        -- draw box / line / arrow / etc from visual selection
        vim.keymap.set("v", "f", ":VBox<CR>", { buffer = true, noremap = true, desc = "Draw from selection" })

        -- optional: more variants (uncomment what you like)
        -- vim.keymap.set("v", "F", ":VBoxH<CR>", { buffer = true })
        -- vim.keymap.set("v", "L", ":VBoxH<CR>", { buffer = true })
        -- vim.keymap.set("v", "H", ":VBoxH<CR>", { buffer = true })
      else
        vim.opt_local.virtualedit = ""
        vim.keymap.del("n", "J", { buffer = true })
        vim.keymap.del("n", "K", { buffer = true })
        vim.keymap.del("n", "L", { buffer = true })
        vim.keymap.del("n", "H", { buffer = true })
        vim.keymap.del("v", "f", { buffer = true })

        vim.b.venn_enabled = nil
      end
    end

    -- toggle with <leader>v (usually <Space>v)
    vim.keymap.set("n", "<leader>v", toggle_venn, { desc = "Toggle Venn mode" })
  end,
}
