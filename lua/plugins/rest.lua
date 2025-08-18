return {
  "rest-nvim/rest.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = "http",
  config = function()
    require("rest-nvim").setup()

    -- Keymaps (only apply when filetype is 'http')
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "http",
      callback = function()
        local opts = { noremap = true, silent = true, buffer = true }
        vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<CR>", opts) -- Run request
        vim.keymap.set("n", "<leader>rp", "<cmd>Rest run last<CR>", opts) -- Re-run last request
        vim.keymap.set("n", "<leader>re", "<cmd>Rest run env<CR>", opts) -- Run with environment (optional)
      end,
    })
  end,
}
