-- [[ Quality of life keymaps Plugin specific keymaps are defined in pluin config ]]
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
keymap("n", "<Tab>", ":bnext<CR>", { silent = true })
keymap("n", "<S-Tab>", ":bprevious<CR>", { silent = true })

-- kill current buffer
keymap("n", "<leader>c", ":bd!<CR>", { silent = true })
