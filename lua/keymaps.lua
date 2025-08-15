-- ============================================================================
-- keymaps
-- ============================================================================

-- Key mappings
vim.g.mapleader = " " -- Set leader key to space
vim.g.maplocalleader = " " -- Set local leader key (NEW)

local map = function(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Normal mode mappings
map("n", "<Esc>", ":nohlsearch<CR>", { silent = true, desc = "Clear search highlights" })

-- Center screen when jumping
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
-- turn off when using snacks smooth scroll
-- map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
-- map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Delete without yanking
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Buffer navigation
map("n", "<S-l>", "<CMD>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", "<CMD>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "close buffer" })

-- Splitting & Resizing
map("n", "<leader>wv", ":vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>wh", ":split<CR>", { desc = "Split window horizontally" })
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Move lines up/down
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- buffer navigation
map("n", "<C-j>", "<C-w>j", { desc = "Move to buffer down" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to buffer up" })
map("n", "<C-h>", "<C-w>h", { desc = "Move to buffer right" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to buffer left" })

-- Better indenting in visual mode
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Better J behavior
map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Quick config editing
map("n", "<leader>rc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })

-- Quick escape
map("i", "jk", "<Esc>", { desc = "escape insert mode" })
map("n", ";", ":", { desc = "better write" })

-- Copy Full File-Path
map("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end)

-- Snacks keymaps

map("n", "<leader>e", function()
	Snacks.explorer()
end, { desc = "File Explorer" })
-- search
map("n", "<leader><space>", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })

map("n", "<leader>sf", function()
	Snacks.picker.files()
end, { desc = "Find Files" })

map("n", "<leader>sr", function()
	Snacks.picker.recent()
end, { desc = "Recent" })

map("n", "<leader>n", function()
	Snacks.picker.notifications()
end, { desc = "Notification History" })

map("n", "<leader>sR", function()
	Snacks.picker.registers()
end, { desc = "Registers" })

map("n", "<leader>s/", function()
	Snacks.picker.search_history()
end, { desc = "Search History" })

map("n", "<leader>sa", function()
	Snacks.picker.autocmds()
end, { desc = "Autocmds" })

map("n", "<leader>sb", function()
	Snacks.picker.lines()
end, { desc = "Buffer Lines" })

map("n", "<leader>sc", function()
	Snacks.picker.command_history()
end, { desc = "Command History" })

map("n", "<leader>sC", function()
	Snacks.picker.commands()
end, { desc = "Commands" })

map("n", "<leader>sd", function()
	Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })

map("n", "<leader>sD", function()
	Snacks.picker.diagnostics_buffer()
end, { desc = "Buffer Diagnostics" })

map("n", "<leader>sh", function()
	Snacks.picker.help()
end, { desc = "Help Pages" })

map("n", "<leader>sH", function()
	Snacks.picker.highlights()
end, { desc = "highlights" })

map("n", "<leader>si", function()
	Snacks.picker.icons()
end, { desc = "Icons" })

map("n", "<leader>sj", function()
	Snacks.picker.jumps()
end, { desc = "Jumps" })

map("n", "<leader>sk", function()
	Snacks.picker.keymaps()
end, { desc = "keymap" })

map("n", "<leader>sl", function()
	Snacks.picker.loclist()
end, { desc = "Location List" })

map("n", "<leader>sm", function()
	Snacks.picker.marks()
end, { desc = "Marks" })

map("n", "<leader>sM", function()
	Snacks.picker.man()
end, { desc = "Man Pages" })

map("n", "<leader>sp", function()
	Snacks.picker.lazy()
end, { desc = "Search for Plugin Spec" })

map("n", "<leader>sq", function()
	Snacks.picker.qflist()
end, { desc = "Quickfix List" })

map("n", "<leader>su", function()
	Snacks.picker.undo()
end, { desc = "Undo History" })

map("n", "<leader>uC", function()
	Snacks.picker.colorschemes()
end, { desc = "Colorschemes" })
