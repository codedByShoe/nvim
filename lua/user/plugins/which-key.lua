return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
      ['<leader>b'] = { name = 'Buffers', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = 'Debug', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = 'Go To', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = 'Rename', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = 'Window', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = 'Search', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = 'Toggle', _ = 'which_key_ignore' },
    }
  end
}
