local vim = vim
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>e', '<Cmd>:NvimTreeToggle<CR>', { silent = true })
-- Save and quit
vim.keymap.set('n', '<C-s>', ':w<CR>', { silent = true })
vim.keymap.set('n', '<C-q>', ':q!<CR>')
-- Cycle buffers
vim.keymap.set('n', '<Tab>', ':bn<CR>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':bp<CR>', { silent = true })
-- Delete Current Buffer
vim.keymap.set('n', '<leader>c', ':bd<CR>', { silent = true })
-- " buffer switching
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
-- " Exit insert mode
vim.keymap.set('i', 'jk', '<Esc>')
-- "Move lines up and down in insert mode
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
-- "Easy way of adding commas and semicolons to end of line
vim.keymap.set('i', ';;', '<Esc>A;<Esc>')
vim.keymap.set('i', ',,', '<Esc>A,<Esc>')
-- " Resize windows with arrows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')
-- " Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
-- "Blade Go To View
vim.keymap.set('n', 'gv', ':GoBlade<CR>')
-- "Floaterm
vim.keymap.set('n', '<C-t>', ':FloattermToggle<CR>', { silent = true })
vim.keymap.set('t', '<C-t>', ':FloattermToggle<CR>', { silent = true })
-- " FZF
vim.keymap.set('n', '<leader>f', ':Files<CR>', { silent = true })
vim.keymap.set('n', '<leader>h', ':History<CR>', { silent = true })
-- " LazyGit
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', { silent = true })
-- TODO comment
vim.keymap.set('n', '<leader>tl', ':TODOQuickfixList<CR>', { silent = true })



