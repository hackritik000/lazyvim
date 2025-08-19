return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
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
