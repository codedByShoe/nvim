return {
  'ccaglak/larago.nvim',
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    -- larago
    vim.keymap.set('n', "<leader>gv", "<cmd>GoBlade<cr>", { silent = true })
  end
}
