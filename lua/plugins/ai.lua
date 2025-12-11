return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup()
    vim.keymap.set("i", "<A-a>", neocodeium.accept)
    vim.keymap.set("i", "<A-c>", neocodeium.clear)
    vim.keymap.set("i", "<A-w>", neocodeium.accept_word)
    vim.keymap.set("i", "<A-l>", neocodeium.accept_line)
  end,
}
