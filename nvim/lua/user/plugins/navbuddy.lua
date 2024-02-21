return {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      window = {
        border = "rounded",
      },
      icons = require("user.core.icons").kind,
      lsp = { auto_attach = true },
    }
  }
