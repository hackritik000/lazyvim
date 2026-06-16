return {
  -- Import the base TypeScript extra (for Treesitter, formatting, etc.)
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- Disable the default LSP servers that LazyVim sets up
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Disable all default TS servers
      opts.servers = opts.servers or {}
      opts.servers.vtsls = { enabled = false }
      opts.servers.ts_ls = { enabled = false } -- new name for tsserver
      opts.servers.tsserver = { enabled = false }
      opts.servers.tsgo = { enabled = false }
      opts.servers.tailwindcss = {
        filetypes = {
          "html",
          "css",
          "scss",
          "sass",
          "javascriptreact",
          "typescriptreact",
          "astro",
        },
      }
    end,
  },

  -- Add typescript-tools.nvim
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      -- Full configuration options: https://github.com/pmizio/typescript-tools.nvim
      on_attach = function(client, bufnr)
        -- Optional: Disable tsserver formatting if you use Prettier/ESLint
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,

      settings = {
        -- Recommended performance settings for large monorepos
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",
        tsserver_max_memory = "auto", -- or "auto"
        code_lens = "off", -- big performance win
        disable_member_code_lens = true,

        -- Inlay hints (can be heavy)
        -- tsserver_file_preferences = {
        --   includeInlayParameterNameHints = "all",
        --   includeInlayFunctionParameterTypeHints = true,
        --   includeInlayVariableTypeHints = true,
        --   includeInlayPropertyDeclarationTypeHints = true,
        -- },

        jsx_close_tag = {
          enable = true,
          filetypes = { "javascriptreact", "typescriptreact" },
        },
      },
    },
  },
}
