-- Set <space> as the leader key
local vim = vim
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Install package manager
--    https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)
require('lazy').setup({ { import = 'user.plugins'}, {} })

require 'user.core.options'
require 'user.core.keymaps'
require 'user.core.autocmd'

-- vim: ts=2 sts=2 sw=2 et
