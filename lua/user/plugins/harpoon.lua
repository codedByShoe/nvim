return {
    'ThePrimeagen/harpoon',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        require("harpoon").setup()
        local keymap = vim.keymap.set
        -- harpoon
        keymap("n", "<leader>ha", ":lua require('harpoon.mark').add_file() <CR>", { silent = true })
        keymap("n", "<leader>hs", ":Telescope harpoon marks <CR>", { silent = true })
        keymap("n", "<leader>he", ":lua require('harpoon.ui').toggle_quick_menu() <CR>", { silent = true })
        keymap("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1) <CR>", { silent = true })
        keymap("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2) <CR>", { silent = true })
        keymap("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3) <CR>", { silent = true })
        keymap("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4) <CR>", { silent = true })
    end
}
