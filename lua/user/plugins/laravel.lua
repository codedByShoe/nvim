return {
  "adalessa/laravel.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "tpope/vim-dotenv",
    "MunifTanjim/nui.nvim",
    "nvimtools/none-ls.nvim",
  },
  cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
  event = { "VeryLazy" },
  config = function()
    require("laravel").setup()
    local keymap = vim.keymap.set
    -- laravel nvim
    keymap('n', "<leader>lm", ":Laravel related<cr>", { silent = true })
    keymap('n', "<leader>lr", ":Laravel routes<cr>", { silent = true })
    keymap('n', "<leader>la", ":Laravel artisan<cr>", { silent = true })
  end
}
