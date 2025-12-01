return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = { -- Replace tsserver with vtsls
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern("tsconfig.json", "package.json", ".git")(fname)
          end,
          settings = {
            typescript = {
              tsserver = {
                maxTsServerMemory = 8192, -- Increase memory limit
                -- Enable incremental compilation for faster analysis
                incremental = true,
                -- Disable expensive features if not needed
                diagnostics = { enable = false, include = { "*.ts", "*.tsx" } },
                -- Enable workspace folders
                workspaceFolders = {
                  supported = true,
                  changeNotifications = true,
                },
              },
              completions = {
                completeFunctionCalls = false, -- Disable if you don’t need function call completions
              },
              workspaceSymbols = { scope = "project" },
              inlayHints = {
                parameterNames = { enabled = "none" },
                parameterTypes = { enabled = false },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                enumMemberValues = { enabled = false },
              },
            },
          },
        },
        biome = {
          filetypes = { -- Restrict to non-Astro filetypes to disable for .astro files
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "json",
            "jsonc",
            "yaml",
          },
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern("biome.json", "package.json", ".git")(fname)
          end,
        },
      },
    },
  },
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
