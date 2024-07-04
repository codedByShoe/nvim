return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      lsp = {
        progress = {
          enabled = true,
          view = "mini"
        },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      views = {
        mini = {
          win_options = {
            winblend = 0
          }
        }
      },

      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            kind = "echo",
            find = "yanked",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            kind = "echo",
            find = "line",
          },
          opts = { skip = true },
        }
      },
      cmdline = {
        enabled = true,
        view = "cmdline",
      }
    })
  end
}
