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
keymap('n', '<leader>bh', '<C-w>h', { silent = true, desc = 'Switch Buffer Left' })
keymap('n', '<leader>bl', '<C-w>l', { silent = true, desc = 'Switch Buffer Right' })
keymap('n', '<leader>bj', '<C-w>j', { silent = true, desc = 'Switch Buffer Up' })
keymap('n', '<leader>bk', '<C-w>k', { silent = true, desc = 'Switch Buffer Down' })

-- Maintain the cursor position when yanking a visual selection.
keymap('v', 'y', 'myy`y')
keymap('v', 'Y', 'myY`y')

-- Paste replace visual selection without copying it.
keymap('v', 'p', '"_dP')

-- Navigate buffers
keymap("n", "<leader>bn", ":bnext<CR>", { silent = true, desc = 'Switch Buffer Next' })
keymap("n", "<leader>bp", ":bprevious<CR>", { silent = true, desc = 'Switch Buffer Previous' })

-- kill current buffer
keymap("n", "<leader>bd", ":bd!<CR>", { silent = true, desc = 'Buffer Delete' })

-- Floaterm
keymap("n", "<leader>tt", "<CMD>FloatermToggle<CR>", { silent = true, desc = 'Toggle Floaterm' })
keymap("t", "<Esc>", "<CMD>FloatermToggle<CR>", { silent = true })
keymap("t", "<C-n>", "<CMD>FloatermNext<CR>", { silent = true })
keymap("t", "<C-p>", "<CMD>FloatermPrev<CR>", { silent = true })
keymap("t", "<C-q>", "<CMD>FloatermKill<CR>", { silent = true })

-- Go If Err
vim.keymap.set("n", "<leader>ee", "<cmd>GoIfErr<CR>", { silent = true })

-- Neotree
keymap("n", "<leader>te", "<CMD>Neotree reveal toggle<CR>", { silent = true, desc = 'Toggle Explorer' })
