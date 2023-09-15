return {
    'ggandor/leap.nvim',
    opts = function(_, opts)
      local leap = require("leap")
      leap.add_default_mappings(true)
    end,
  }
