
-- Define your function
local function show_documentation()
  if vim.fn["CocAction"]('hasProvider', 'hover') == 1 then
    vim.fn["CocActionAsync"]('doHover')
  else
    vim.api.nvim_feedkeys('K', 'n', true)
  end
end

-- Create a command to call the function
vim.cmd('command! ShowDocumentation lua show_documentation()')

-- Your keymap to call the function
vim.keymap.set('n', '<silent> K', ':ShowDocumentation<CR>', {noremap = true, silent = true})

-- Your insert mode keymaps for COC
vim.keymap.set('i', '<Tab>', 'pumvisible() ? coc#_select_confirm() : "\\<C-g>u\\<TAB>"', {expr = true, noremap = true, silent = true})
vim.keymap.set('i', '<CR>', '\\"<c-g>u\\<CR>"', {expr = true, noremap = true, silent = true})
vim.keymap.set('n', 'gd', ':call CocActionAsync("jumpDefinition")<CR>')
vim.keymap.set('n', '<leader>ca ', ':call CocAction("codeAction")<CR>', { silent = true })

