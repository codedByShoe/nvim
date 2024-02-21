vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local keymap = vim.keymap.set
-- Keymaps for better default experience
-- See `:help keymap()`
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
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
keymap('v', 'y', 'myy`y')
keymap('v', 'Y', 'myY`y')
-- Paste replace visual selection without copying it.
keymap('v', 'p', '"_dP')

-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '<leader>d', vim.diagnostic.open_float)
keymap('n', '<leader>q', vim.diagnostic.setloclist)
-- navigate docs noice
keymap({ "n", "i", "s" }, "<C-f>", function()
  if not require("noice.lsp").scroll(4) then
    return "<c-f>"
  end
end, { silent = true, expr = true })

keymap({ "n", "i", "s" }, "<C-b>", function()
  if not require("noice.lsp").scroll(-4) then
    return "<c-b>"
  end
end, { silent = true, expr = true })

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", { silent = true })
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { silent = true })
keymap("n", "<leader>o", "<cmd>Navbuddy<CR>", { silent = true })
keymap("n", "<leader>ge", "<cmd>GoIfErr<CR>", { silent = true })
-- open db client
keymap("n", "<leader>db", "<cmd>DBUIToggle<CR>", { silent = true })
-- run rest client
keymap("n", "<leader>hr", "<Plug>RestNvim", { silent = true })
-- ufo
keymap('n', 'zr', require('ufo').openAllFolds, { silent = true })
keymap('n', 'zm', require('ufo').closeAllFolds, { silent = true })
keymap('n', 'zk',
  function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
      vim.lsp.buf.hover()
    end
  end, { silent = true })
-- toggleterm
keymap({"n", "t"}, "<C-t>", "<cmd>ToggleTerm<CR>", { silent = true })
-- todo-comment
keymap("n", "<leader>st", "<cmd>TodoTelescope<CR>", { silent = true })
-- lazygir
keymap("n", "<leader>gg",
  function()
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true })
    lazygit:toggle()
  end, { silent = true })
-- cokeline
keymap("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)", { silent = true })
keymap("n", "<Tab>", "<Plug>(cokeline-focus-next)", { silent = true })
-- AdvancedNewFile

keymap("n", "<leader>nf", "<cmd>AdvancedNewFile<CR>", { silent = true })
