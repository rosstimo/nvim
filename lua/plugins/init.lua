return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  --
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    config = function()
      require("copilot_cmp").setup()
    end,
    dependencies = {
      {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        config = function()
          require("copilot").setup({
            panel = { enabled = false },
            suggestion = {
              enabled = true,
              auto_trigger = true,
              hide_during_completion = false,
              debounce = 75,
              keymap = {
                accept = "<tab>",
                accept_word = false,
                accept_line = false,
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
              },
            },
            filetypes = {
              yaml = true,
              markdown = true,
              help = false,
              gitcommit = false,
              gitrebase = false,
              hgcommit = false,
              svn = false,
              cvs = false,
              ["."] = false,
            },
          })
        end,
      },
    },
  },

  -- nvim-cmp setup
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        sources = {
          { name = "copilot",  keyword_length = 0, group_index = 1 },
          -- other sources
          { name = "nvim_lsp", keyword_length = 1, group_index = 2 },
          { name = "buffer",   keyword_length = 1, group_index = 3 },
          {
            name = "look",
            keyword_length = 1,
            group_index = 4,
            option = {
              convert_case = true,
              loud = true,
              dict = "usr/share/dict/words"
            }
          },
          { name = "path",    keyword_length = 1, group_index = 5 },
          { name = "luasnip", keyword_length = 3, group_index = 6 },
        },
      })
    end,
  },
}
