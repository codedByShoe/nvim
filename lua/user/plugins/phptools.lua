return {
  'ccaglak/phptools.nvim',
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    require("phptools").setup({
      ui = true
    })

    local keymap = vim.keymap.set
    -- phptools
    keymap('n', '<leader>pm', "<cmd>PhpMethod<cr>", { silent = true })
    keymap('n', "<leader>pc", "<cmd>PhpClass<cr>", { silent = true })
    keymap('n', "<leader>ps", "<cmd>PhpScripts<cr>", { silent = true })
    keymap('n', "<leader>pn", "<cmd>PhpNamespace<cr>", { silent = true })
    keymap('n', "<leader>pg", "<cmd>PhpGetSet<cr>", { silent = true })
    keymap('n', "<leader>pf", "<cmd>PhpCreate<cr>", { silent = true })
  end
}
