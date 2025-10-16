return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = { -- Replace tsserver with vtsls
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("package.json", ".git")(fname)
          end,
          settings = {
            typescript = {
              tsserver = {
                maxTsServerMemory = 8192, -- Increase memory limit
              },
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
            return require("lspconfig.util").root_pattern("package.json", "biome.json", ".git")(fname)
          end,
        },
      },
    },
  },
}
