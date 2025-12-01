---@class tokyonight.Config
---@field on_colors fun(colors: ColorScheme)
---@field on_highlights fun(highlights: tokyonight.Highlights, colors: ColorScheme)
return {
  "folke/tokyonight.nvim",
  lazy = true,
  opts = {
    transparent = true, -- Enable transparency (disables background color setting)
    styles = {
      sidebars = "transparent", -- Make sidebars (e.g., NvimTree) transparent
      floats = "transparent", -- Make floating windows (e.g., LSP hover) transparent
    },
    ---@param colors ColorScheme
    on_colors = function(colors)
      -- colors.blue = "#956f4d" -- Override the blue color here
      -- -- Optional: Override related shades if needed
      -- colors.blue0 = "#8c6a4b"
      -- colors.blue1 = "#6a5542"
      colors.terminal = {
        -- blue = "#82aaff",
        -- blue_bright = "#9ab8ff",
        -- cyan = "#86e1fc",
        -- cyan_bright = "#b2ebff",
      }
    end,
  },
}
-- return {
--   -- Gruvbox with custom background tweaks
--   {
--     "ellisonleao/gruvbox.nvim",
--     priority = 1000, -- Load early
--     opts = {
--       transparent_mode = true, -- Enable for terminal transparency (eye-friendly)
--       contrast = "hard", -- "soft" for lower strain; try "hard" or "" for alternatives
--       terminal_colors = true, -- Consistent terminal palette
--     },
--     config = function(_, opts)
--       require("gruvbox").setup(opts)
--
--       -- Optional: Set global background (dark/light)
--       vim.o.background = "dark" -- Or "light" for beige background
--
--       -- Optional: Custom palette override (e.g., warmer dark bg for eye health)
--       -- vim.g.gruvbox_baby_palette_overrides = {
--       --   bg0 = "#1d2021",  -- Softer dark brown (default is "#282828")
--       -- }
--
--       vim.cmd("colorscheme gruvbox")
--     end,
--   },
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox",
--     },
--   },
-- }

-- return {
--   -- add gruvbox
--   { "ellisonleao/gruvbox.nvim" },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox",
--     },
--   },
-- }

-- return {
--   "catppuccin/nvim",
--   lazy = true,
--   name = "catppuccin",
--   opts = {
--     flavour = "auto", -- latte, frappe, macchiato, mocha
--     background = { -- :h background
--       light = "latte",
--       dark = "mocha",
--     },
--     transparent_background = true, -- disables setting the background color.
--     float = {
--       transparent = true, -- enable transparent floating windows
--       solid = false, -- use solid styling for floating windows, see |winborder|
--     },
--     show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
--     term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
--     dim_inactive = {
--       enabled = true, -- dims the background color of inactive window
--       shade = "dark",
--       percentage = 0.15, -- percentage of the shade to apply to the inactive window
--     },
--     no_italic = false, -- Force no italic
--     no_bold = false, -- Force no bold
--     no_underline = false, -- Force no underline
--     styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
--       comments = { "italic" }, -- Change the style of comments
--       conditionals = { "italic" },
--       loops = {},
--       functions = {},
--       keywords = {},
--       strings = {},
--       variables = {},
--       numbers = {},
--       booleans = {},
--       properties = {},
--       types = {},
--       operators = {},
--       -- miscs = {}, -- Uncomment to turn off hard-coded styles
--     },
--     lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
--       virtual_text = {
--         errors = { "italic" },
--         hints = { "italic" },
--         warnings = { "italic" },
--         information = { "italic" },
--         ok = { "italic" },
--       },
--       underlines = {
--         errors = { "underline" },
--         hints = { "underline" },
--         warnings = { "underline" },
--         information = { "underline" },
--         ok = { "underline" },
--       },
--       inlay_hints = {
--         background = true,
--       },
--     },
--     color_overrides = {},
--     custom_highlights = {},
--     default_integrations = true,
--     auto_integrations = false,
--     integrations = {
--       cmp = true,
--       gitsigns = true,
--       nvimtree = true,
--       notify = false,
--       mini = {
--         enabled = true,
--         indentscope_color = "",
--       },
--       -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--     },
--   },
--   specs = {
--     {
--       "akinsho/bufferline.nvim",
--       optional = true,
--       opts = function(_, opts)
--         if (vim.g.colors_name or ""):find("catppuccin") then
--           opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
--         end
--       end,
--     },
--   },
-- }
