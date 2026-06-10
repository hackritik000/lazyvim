-- if true then
--   return {}
-- end

return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      formatters_by_ft = {
        astro = { "prettier" }, -- Format Astro with Prettier
        -- Add other filetypes if needed, e.g., javascript = { "prettier" }, typescript = { "prettier" }
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true, -- Fallback to LSP if formatter fails
      },
      -- Optional: Install Prettier via Mason if not using project-local npm
      formatters = {
        prettier = {
          prepend_args = { "--plugin", "prettier-plugin-astro" }, -- Ensure Astro plugin is used
        },
      },
    },
  },
}
