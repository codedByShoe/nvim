return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  lazy = false,
  priority = 100,
  dependencies = {
    { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'onsails/lspkind.nvim',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
  },
  config = function()
    -- require('user.core.snippets')
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')
    lspkind.init {}
    luasnip.config.setup {}
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = {
          scrollbar = true,
        },
        documentation = {
          scrollbar = true,
        }
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete {},
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = "cody" },
        { name = 'path' },
        { name = 'buffer' },
      },
    })


    vim.snippet.expand = luasnip.lsp_expand

    ---@diagnostic disable-next-line: duplicate-set-field
    vim.snippet.active = function(filter)
      filter = filter or {}
      filter.direction = filter.direction or 1

      if filter.direction == 1 then
        return luasnip.expand_or_jumpable()
      else
        return luasnip.jumpable(filter.direction)
      end
    end

    ---@diagnostic disable-next-line: duplicate-set-field
    vim.snippet.jump = function(direction)
      if direction == 1 then
        if luasnip.expandable() then
          return luasnip.expand_or_jump()
        else
          return luasnip.jumpable(1) and luasnip.jump(1)
        end
      else
        return luasnip.jumpable(-1) and luasnip.jump(-1)
      end
    end

    vim.snippet.stop = luasnip.unlink_current

    luasnip.config.set_config {
      history = true,
      updateevents = "TextChanged,TextChangedI",
      override_builtin = true,
    }

    for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/user/snippets/*.lua", true)) do
      loadfile(ft_path)()
    end

    -- require('luasnip.loaders.from_lua').load({ paths = { '~/.config/nvim/lua/user/snippets/html.lua' } })

    vim.keymap.set({ "i", "s" }, "<c-k>", function()
      return vim.snippet.active { direction = 1 } and vim.snippet.jump(1)
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<c-j>", function()
      return vim.snippet.active { direction = -1 } and vim.snippet.jump(-1)
    end, { silent = true })



    -- Setup up vim-dadbod
    cmp.setup.filetype({ "sql" }, {
      sources = {
        { name = "vim-dadbod-completion" },
        { name = "buffer" },
      },
    })
  end
}
