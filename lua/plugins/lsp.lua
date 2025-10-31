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
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern("biome.json", "package.json", ".git")(fname)
          end,
        },
      },
    },
  },
}
