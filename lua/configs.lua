local vim = vim
-- Floaterm
vim.g.floaterm_wintype = 'split'
vim.g.floaterm_height=0.3
-- " colorscheme config
vim.g.tokyodark_transparent_background = 0
vim.g.tokyodark_enable_italic_comment = 1
vim.g.tokyodark_enable_italic = 1
vim.g.tokyodark_color_gamma = "1.0"
vim.cmd('colorscheme tokyodark')

-- popui
vim.g.popui_border_style = "rounded"
vim.ui.select = require"popui.ui-overrider"
vim.ui.input = require"popui.input-overrider"

-- " astro config
vim.g.astro_typescript = 'enable'
vim.g.astro_stylus = 'enable'

require('plugins.coc')

require('leap').add_default_mappings()

require('plugins.noice')

require("todo").setup()

require('plugins.lualine')

require('neoscroll').setup()

require('plugins.bufferline')

require('gitsigns').setup()

require('plugins.nvimtree')

require('bufdelete').bufdelete(0, true)

require('notify').setup({
	background_colour = "#000000",
})

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
	show_end_of_line = true,
	space_char_blankline = " ",
}
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

