-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby
vim.keymap.set("i", "jk", "<Esc>")

-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set("i", ";;", "<Esc>A;<Esc>")
vim.keymap.set("i", ",,", "<Esc>A,<Esc>")

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Maintain the cursor position when yanking a visual selection.
vim.keymap.set("v", "y", "myy`y")
vim.keymap.set("v", "Y", "myY`y")

-- Paste replace visual selection without copying it.
vim.keymap.set("v", "p", '"_dP')

vim.keymap.set("n", "<leader>fh", "<CMD> Telescope oldfiles<CR>", { desc = "Show History" })
vim.keymap.set(
  "n",
  "<leader><space>",
  "<CMD> Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal<CR>",
  { desc = "Show Open Buffers" }
)
vim.keymap.set("n", "<leader>fg", "<CMD> Telescope git_files<CR>", { desc = "Search Git Files" })
vim.keymap.set("n", "<leader>ff", "<CMD> Telescope find_files<CR>", { desc = "Search Files" })
vim.keymap.set("n", "<leader>f?", "<CMD> Telescope help_tags<CR>", { desc = "Search Help" })
vim.keymap.set("n", "<leader>fw", "<CMD> Telescope grep_string<CR>", { desc = "Search Workspace" })
vim.keymap.set("n", "<leader>fl", "<CMD> Telescope live_grep grep_open_files=true<CR>", { desc = "Search Live Grep" })
vim.keymap.set(
  "n",
  "<leader>fd",
  "<CMD> Telescope diagnostics initial_mode=normal<CR>",
  { desc = "Search Diagnostics" }
)

vim.keymap.set("n", "<leader>te", "<CMD>lua Snacks.picker.explorer()<CR>", { desc = "Toggle Explorer" })
