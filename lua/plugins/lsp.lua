return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          root_dir = function(fname)
            -- Detect nearest package.json instead of repo root
            return require("lspconfig.util").root_pattern("package.json")(fname)
          end,
          settings = {
            typescript = {
              preferences = {
                importModuleSpecifierEnding = "auto",
                preferTypeOnlyAutoImports = true, -- 👈 force "import type"
              },
            },
            javascript = {
              preferences = {
                importModuleSpecifierEnding = "auto",
                preferTypeOnlyAutoImports = true, -- 👈 for JS + JSDoc
              },
            },
          },
        },
        biome = {},
      },
    },
  },
}
