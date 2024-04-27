
local keymap = vim.keymap.set

-- Keymaps for better default experience
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
keymap('i', 'jk', '<Esc>', { silent = true })

-- Stay in indent mode
keymap("v", "<", "<gv", { silent = true })
keymap("v", ">", ">gv", { silent = true })

-- Easy insertion of a trailing ; or , from insert mode.
keymap('i', ';;', '<Esc>A;<Esc>')
keymap('i', ',,', '<Esc>A,<Esc>')

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- " buffer switching
keymap('n', '<C-h>', '<C-w>h', { silent = true })
keymap('n', '<C-l>', '<C-w>l', { silent = true })
keymap('n', '<C-j>', '<C-w>j', { silent = true })
keymap('n', '<C-k>', '<C-w>k', { silent = true })

-- Maintain the cursor position when yanking a visual selection.
keymap('v', 'y', 'myy`y')
keymap('v', 'Y', 'myY`y')

-- Paste replace visual selection without copying it.
keymap('v', 'p', '"_dP')

-- Navigate buffers
-- keymap("n", "<Tab>", ":bnext<CR>", { silent = true })
-- keymap("n", "<S-Tab>", ":bprevious<CR>", { silent = true })
-- -- kill current buffer
-- keymap("n", "<leader>c", ":bd!<CR>", { silent = true })
--
-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '<leader>d', vim.diagnostic.open_float)
keymap('n', '<leader>q', vim.diagnostic.setloclist)
-- mini files
keymap('n', '<leader>e', '<cmd>lua MiniFiles.open() <CR>', {silent = true})

keymap("n", "<leader>ge", "<cmd>GoIfErr<CR>", { silent = true })

-- harpoon
keymap("n", "<leader>ha", ":lua require('harpoon.mark').add_file() <CR>", { silent = true})
keymap("n", "<leader>hs", ":Telescope harpoon marks <CR>", { silent = true})
keymap("n", "<leader>he", ":lua require('harpoon.ui').toggle_quick_menu() <CR>", { silent = true})
keymap("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1) <CR>", { silent = true })
keymap("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2) <CR>", { silent = true })
keymap("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3) <CR>", { silent = true })
keymap("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4) <CR>", { silent = true })

-- ufo
keymap('n', 'zr', require('ufo').openAllFolds, { silent = true })
keymap('n', 'zm', require('ufo').closeAllFolds, { silent = true })
keymap('n', 'zk', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
      vim.lsp.buf.hover()
    end
  end, { silent = true })

