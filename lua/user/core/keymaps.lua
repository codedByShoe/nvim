-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- " Exit insert mode
vim.keymap.set('i', 'jk', '<Esc>', { silent = true })
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })
-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set('i', ';;', '<Esc>A;<Esc>')
vim.keymap.set('i', ',,', '<Esc>A,<Esc>')
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- " buffer switching
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', 'myy`y')
vim.keymap.set('v', 'Y', 'myY`y')
-- Paste replace visual selection without copying it.
vim.keymap.set('v', 'p', '"_dP')


-- TODO comment
vim.keymap.set('n', '<leader>st', ':TODOQuickfixList<CR>', { silent = true })


-- Navigate buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })

-- [[COC keymaps]]
-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
  { silent = true, noremap = true, expr = true, replace_keycodes = false })
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]],
  { silent = true, noremap = true, expr = true, replace_keycodes = false })
-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
  { silent = true, noremap = true, expr = true, replace_keycodes = false })
-- Use <c-j> to trigger snippets
vim.keymap.set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
vim.keymap.set("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })
-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })
-- GoTo code navigation
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })
vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })
-- Symbol renaming
vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })
-- Formatting selected code
vim.keymap.set("x", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })
vim.keymap.set("n", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })
-- Apply codeAction to the selected region
-- Example: `<leader>aap` for current paragraph
vim.keymap.set("x", "<leader>a", "<Plug>(coc-codeaction-selected)", { silent = true, nowait = true })
vim.keymap.set("n", "<leader>a", "<Plug>(coc-codeaction-selected)", { silent = true, nowait = true })
-- Remap keys for apply code actions at the cursor position.
vim.keymap.set("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", { silent = true, nowait = true })
-- Remap keys for apply code actions affect whole buffer.
vim.keymap.set("n", "<leader>as", "<Plug>(coc-codeaction-source)", { silent = true, nowait = true })
-- Remap keys for applying codeActions to the current buffer
vim.keymap.set("n", "<leader>ac", "<Plug>(coc-codeaction)", { silent = true, nowait = true })
-- Apply the most preferred quickfix action on the current line.
vim.keymap.set("n", "<leader>qf", "<Plug>(coc-fix-current)", { silent = true, nowait = true })
-- Remap keys for apply refactor code actions.
vim.keymap.set("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
vim.keymap.set("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
vim.keymap.set("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
-- Run the Code Lens actions on the current line
vim.keymap.set("n", "<leader>cl", "<Plug>(coc-codelens-action)", { silent = true, nowait = true })
-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
vim.keymap.set("x", "if", "<Plug>(coc-funcobj-i)", { silent = true, nowait = true })
vim.keymap.set("o", "if", "<Plug>(coc-funcobj-i)", { silent = true, nowait = true })
vim.keymap.set("x", "af", "<Plug>(coc-funcobj-a)", { silent = true, nowait = true })
vim.keymap.set("o", "af", "<Plug>(coc-funcobj-a)", { silent = true, nowait = true })
vim.keymap.set("x", "ic", "<Plug>(coc-classobj-i)", { silent = true, nowait = true })
vim.keymap.set("o", "ic", "<Plug>(coc-classobj-i)", { silent = true, nowait = true })
vim.keymap.set("x", "ac", "<Plug>(coc-classobj-a)", { silent = true, nowait = true })
vim.keymap.set("o", "ac", "<Plug>(coc-classobj-a)", { silent = true, nowait = true })
-- Remap <C-f> and <C-b> to scroll float windows/popups
---@diagnostic disable-next-line: redefined-local
vim.keymap.set("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"',
  { silent = true, nowait = true, expr = true })
vim.keymap.set("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"',
  { silent = true, nowait = true, expr = true })
vim.keymap.set("i", "<C-f>",
  'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"',
  { silent = true, nowait = true, expr = true })
vim.keymap.set("i", "<C-b>",
  'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"',
  { silent = true, nowait = true, expr = true })
vim.keymap.set("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"',
  { silent = true, nowait = true, expr = true })
vim.keymap.set("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"',
  { silent = true, nowait = true, expr = true })
-- Use CTRL-S for selections ranges
-- Requires 'textDocument/selectionRange' support of language server
vim.keymap.set("n", "<C-s>", "<Plug>(coc-range-select)", { silent = true })
vim.keymap.set("x", "<C-s>", "<Plug>(coc-range-select)", { silent = true })
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
-- Show all diagnostics
vim.keymap.set("n", "<space>a", ":<C-u>CocList diagnostics<cr>", { silent = true, nowait = true })
-- Show commands
vim.keymap.set("n", "<space>c", ":<C-u>CocList commands<cr>", { silent = true, nowait = true })
-- Find symbol of current document
vim.keymap.set("n", "<space>o", ":<C-u>CocList outline<cr>", { silent = true, nowait = true })
-- Search workspace symbols
vim.keymap.set("n", "<space>s", ":<C-u>CocList -I symbols<cr>", { silent = true, nowait = true })
-- Do default action for next item
vim.keymap.set("n", "<space>j", ":<C-u>CocNext<cr>", { silent = true, nowait = true })
-- Do default action for previous item
vim.keymap.set("n", "<space>k", ":<C-u>CocPrev<cr>", { silent = true, nowait = true })
-- Resume latest coc list
vim.keymap.set("n", "<space>p", ":<C-u>CocListResume<cr>", { silent = true, nowait = true })

