return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.surround').setup()
    require('mini.indentscope').setup({
      symbol = "│",
    })
    require("mini.starter").setup()
    require("mini.notify").setup({
      -- Content management
      content = {
        -- Function which formats the notification message
        -- By default prepends message with notification time
        format = nil,

        -- Function which orders notification array from most to least important
        -- By default orders first by level and then by update timestamp
        sort = nil,
      },

      -- Notifications about LSP progress
      lsp_progress = {
        -- Whether to enable showing
        enable = true,

        -- Duration (in ms) of how long last message should be shown
        duration_last = 1000,
      },

      -- Window options
      window = {
        -- Floating window config
        config = {},

        -- Maximum window width as share (between 0 and 1) of available columns
        max_width_share = 0.382,

        -- Value of 'winblend' option
        winblend = 0,
      },
    })
    require('mini.jump').setup()
    require('mini.pairs').setup()
    require('mini.cursorword').setup()
    require('mini.comment').setup({
      mappings = {
        -- Toggle comment (like `gcip` - comment inner paragraph) for both
        -- Normal and Visual modes
        comment = '<space>/',

        -- Toggle comment on current line
        comment_line = '<space>/',

        -- Toggle comment on visual selection
        comment_visual = '<space>/',

        -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        -- Works also in Visual mode if mapping differs from `comment_visual`
        textobject = 'gc',
      },

    })
    require("mini.ai").setup()

    -- mini files
    vim.keymap.set("n", "<leader>ge", "<cmd>GoIfErr<CR>", { silent = true })
  end,
}
