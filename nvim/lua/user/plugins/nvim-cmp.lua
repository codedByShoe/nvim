return {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'rafamadriz/friendly-snippets',
      "roobert/tailwindcss-colorizer-cmp.nvim",
      opts = function(_, opts)
        local format_kinds = opts.formatting.format
        opts.formatting.format = function(entry, item)
          format_kinds(entry, item)
          return require("tailwindcss-colorizer-cmp").formatter(entry, item)
        end
      end
    },
  }
