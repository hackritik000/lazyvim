return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = {
          hidden = true,
          ignored = true,
          exclude = {
            "node_modules",
            ".next",
            "dist",
            "build",
          },
        },
      },
    },
  },
}
