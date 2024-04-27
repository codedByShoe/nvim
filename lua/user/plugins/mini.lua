return {
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }
    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()
    require('mini.indentscope').setup({
      symbol = "│",
    })
    require('mini.pairs').setup()
    require('mini.cursorword').setup()
    require('mini.comment').setup()
    require('mini.files').setup()
    require('mini.notify').setup({
      -- Notifications about LSP progress
      lsp_progress = {
        -- Whether to enable showing
        enable = true,

        -- Duration (in ms) of how long last message should be shown
        duration_last = 1000,
      },

      -- Window options
      window = {
        -- Maximum window width as share (between 0 and 1) of available columns
        max_width_share = 0.382,

        -- Value of 'winblend' option
        winblend = 0,
      },
    })
    vim.notify = require("mini.notify").make_notify()
  end,
}
