return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {
      "<leader>ac",
      function()
        require("codecompanion").toggle()
      end,
      desc = "CodeCompanion Chat",
    },
  },
  config = function()
    require("codecompanion").setup({
      -- Your adapter and strategy configurations go here
      adapters = {
        -- Example for Deepseek (replace with your chosen LLM and API key)
        -- deepseek = function()
        --   return require("codecompanion.adapters").extend("deepseek", {
        --     env = {
        --       api_key = "YOUR_DEEPSEEK_API_KEY", -- Replace with your actual API key
        --     },
        --   })
        -- end,
        -- Example for Gemini (you would extend a Gemini adapter if available or a generic OpenAI-compatible one)
        gemini = function()
          return require("codecompanion.adapters").extend(
            "gemini", -- <--- Change this from "openai" to "gemini"
            {
              base_url = "https://generativelanguage.googleapis.com/v1beta",
              env = {
                api_key = os.getenv("GEMINI_API_KEY"),
              },
              model = "gemini-2.5-flash",
            }
          )
        end,
      },
      strategies = {
        chat = { adapter = "gemini" }, -- Use "deepseek" or "gemini" or your chosen adapter
        inline = { adapter = "gemini" },
        agent = { adapter = "gemini" },
        keymaps = {
          options = {
            modes = {
              n = "?",
            },
            callback = "keymaps.options",
            description = "Options",
            hide = true,
          },
          completion = {
            modes = {
              i = "<S-Tab>",
            },
            index = 1,
            callback = "keymaps.completion",
            description = "Completion Menu",
          },
          send = {
            modes = {
              n = { "<CR>", "<C-s>" },
              i = "<C-s>",
            },
            index = 2,
            callback = "keymaps.send",
            description = "Send",
          },
          regenerate = {
            modes = {
              n = "gr",
            },
            index = 3,
            callback = "keymaps.regenerate",
            description = "Regenerate the last response",
          },
          close = {
            modes = {
              n = { "<C-x>" },
              i = "<leader-c>",
            },
            index = 4,
            callback = "keymaps.close",
            description = "Close Chat",
          },
          stop = {
            modes = {
              n = "q",
            },
            index = 5,
            callback = "keymaps.stop",
            description = "Stop Request",
          },
          clear = {
            modes = {
              n = "gx",
            },
            index = 6,
            callback = "keymaps.clear",
            description = "Clear Chat",
          },
          codeblock = {
            modes = {
              n = "gc",
            },
            index = 7,
            callback = "keymaps.codeblock",
            description = "Insert Codeblock",
          },
          yank_code = {
            modes = {
              n = "gy",
            },
            index = 8,
            callback = "keymaps.yank_code",
            description = "Yank Code",
          },
          pin = {
            modes = {
              n = "gp",
            },
            index = 9,
            callback = "keymaps.pin_context",
            description = "Pin context",
          },
          watch = {
            modes = {
              n = "gw",
            },
            index = 10,
            callback = "keymaps.toggle_watch",
            description = "Watch Buffer",
          },
          next_chat = {
            modes = {
              n = "}",
            },
            index = 11,
            callback = "keymaps.next_chat",
            description = "Next Chat",
          },
          previous_chat = {
            modes = {
              n = "{",
            },
            index = 12,
            callback = "keymaps.previous_chat",
            description = "Previous Chat",
          },
          next_header = {
            modes = {
              n = "]]",
            },
            index = 13,
            callback = "keymaps.next_header",
            description = "Next Header",
          },
          previous_header = {
            modes = {
              n = "[[",
            },
            index = 14,
            callback = "keymaps.previous_header",
            description = "Previous Header",
          },
          change_adapter = {
            modes = {
              n = "ga",
            },
            index = 15,
            callback = "keymaps.change_adapter",
            description = "Change adapter",
          },
          fold_code = {
            modes = {
              n = "gf",
            },
            index = 15,
            callback = "keymaps.fold_code",
            description = "Fold code",
          },
          debug = {
            modes = {
              n = "gd",
            },
            index = 16,
            callback = "keymaps.debug",
            description = "View debug info",
          },
          system_prompt = {
            modes = {
              n = "gs",
            },
            index = 17,
            callback = "keymaps.toggle_system_prompt",
            description = "Toggle the system prompt",
          },
          auto_tool_mode = {
            modes = {
              n = "gta",
            },
            index = 18,
            callback = "keymaps.auto_tool_mode",
            description = "Toggle automatic tool mode",
          },
          goto_file_under_cursor = {
            modes = { n = "gR" },
            index = 19,
            callback = "keymaps.goto_file_under_cursor",
            description = "Open the file under cursor in a new tab.",
          },
          copilot_stats = {
            modes = { n = "gS" },
            index = 20,
            callback = "keymaps.copilot_stats",
            description = "Show Copilot usage statistics",
          },
        },
      },
    })
  end,
}
