
-- [[ Setting options ]]
vim.opt.hlsearch = false
vim.opt.mouse = 'a'
vim.opt.breakindent = true
vim.opt.cursorline = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = 'menuone,noselect'
vim.opt.termguicolors = true
vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.inccommand = 'split'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = 'split'
vim.opt.scrolloff = 10
vim.opt.showmode = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.formatoptions = "rqnl1j"
vim.opt.incsearch = true
-- Save undo history
vim.opt.undofile = true
-- netrw
vim.g.netrw_winsize = 20
vim.g.netrw_banner = false
vim.opt.scrolloff = 10

vim.opt.fillchars = {
  fold = " ",
  foldopen = "",
  foldclose = "",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

vim.opt.list = true

vim.opt.listchars = {
  tab = "▸ ",
  trail = "·",
  extends = "›",
  precedes = "‹",
  eol = "↲",
  nbsp = "␣",
}
