local Plug = vim.fn['plug#']
local PATH = "C:\\Users\\Andre\\AppData\\Local\\nvim-data\\Plugged"
vim.call('plug#begin', PATH)
-- UI
Plug 'lukas-reineke/indent-blankline.nvim'
Plug ('folke/tokyonight.nvim', { branch = 'main' })
Plug 'lunarvim/synthwave84.nvim'
Plug 'tiagovla/tokyodark.nvim'
Plug('akinsho/bufferline.nvim', { tag = 'v3.*' })
Plug 'nvim-lualine/lualine.nvim'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate' })
Plug 'karb94/neoscroll.nvim'
Plug 'xiyaowong/nvim-transparent'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/nvim-tree/nvim-web-devicons'
Plug('projekt0n/github-nvim-theme', { tag = 'v0.0.7' })
Plug 'lewis6991/gitsigns.nvim'
Plug 'ap/vim-css-color'
Plug 'rcarriga/nvim-notify'
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'hood/popui.nvim'
-- Helpers
Plug 'ggandor/leap.nvim'
Plug('https://github.com/tpope/vim-commentary')
Plug('tpope/vim-surround')
Plug('https://github.com/jiangmiao/auto-pairs')
-- Neovim Utils
Plug('nvim-lua/plenary.nvim')
Plug('voldikss/vim-floaterm')
Plug 'nvim-tree/nvim-tree.lua'
Plug 'famiu/bufdelete.nvim'
Plug('neoclide/coc.nvim', { branch = 'release'})
-- Plug 'junegunn/fzf.vim'
Plug(Plug 'nvim-telescope/telescope.nvim', { tag = '0.1.2' })
Plug 'kdheepak/lazygit.nvim'
Plug 'AmeerTaweel/todo.nvim'
-- PHP / Lang
Plug('yaegassy/coc-intelephense', {['do'] = 'yarn install --frozen-lockfile'})
Plug 'wuelnerdotexe/vim-astro'
Plug 'wavded/vim-stylus'
Plug('yaegassy/coc-astro', {['do'] = 'yarn install --frozen-lockfile'})
Plug 'jwalton512/vim-blade'
Plug 'ccaglak/larago.nvim'
-- Misc
Plug 'wakatime/vim-wakatime'

vim.call('plug#end')


