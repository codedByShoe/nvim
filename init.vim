" Vim Plug *************************************************/
call plug#begin()
" ****** UI
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'lunarvim/synthwave84.nvim'
Plug 'tiagovla/tokyodark.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'karb94/neoscroll.nvim'
Plug 'xiyaowong/nvim-transparent'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/nvim-tree/nvim-web-devicons'
Plug 'projekt0n/github-nvim-theme', { 'tag': 'v0.0.7' }
Plug 'lewis6991/gitsigns.nvim'
Plug 'ap/vim-css-color'
Plug 'rcarriga/nvim-notify'
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'hood/popui.nvim'
" ***** Helpers
Plug 'unblevable/quick-scope'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'https://github.com/jiangmiao/auto-pairs'
" ***** Neovim Utils
Plug 'Mohammed-Taher/AdvancedNewFile.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-floaterm'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kdheepak/lazygit.nvim'
" ***** PHP / Lang
Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}
Plug 'wuelnerdotexe/vim-astro'
Plug 'wavded/vim-stylus'
Plug 'yaegassy/coc-astro', {'do': 'yarn install --frozen-lockfile'}
Plug 'jwalton512/vim-blade'
Plug 'ccaglak/larago.nvim'
" ***** Misc
Plug 'wakatime/vim-wakatime'

call plug#end()
" **********************************************************/
" Plugin Vimscript Config *********************************/
" colorscheme config
let g:tokyodark_transparent_background = 0
let g:tokyodark_enable_italic_comment = 1
let g:tokyodark_enable_italic = 1
let g:tokyodark_color_gamma = "1.0"
colorscheme tokyodark

" astro config
let g:astro_typescript = 'enable'
let g:astro_stylus = 'enable'
" Popui Available styles: "sharp" | "rounded" | "double"
let g:popui_border_style = "rounded"
"**********************************************************/
" Key Maps ************************************************/
let mapleader = " "
" Basic leader Mappings
:nmap <leader>e <Cmd>:NvimTreeToggle<CR>
" Save Current Buffer
nnoremap <C-s> :w<CR>
" Quit Nvim 
nnoremap <C-q> :q<CR>
" Cycle buffers
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
" Delete Current Buffer
nnoremap <leader>c :bd<CR>
" No highlight after search
nnoremap <leader>l :nohl<CR>
" buffer switching
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
" Exit insert mode
:imap jk <Esc>
"Move lines up and down in insert mode
inoremap <A-j> <Esc>:move .+1<CR>==gi
inoremap <A-k> <Esc>:move .-2<CR>==gi
"Easy way of adding commas and semicolons to end of line
inoremap ;; <Esc>A;<Esc> 
inoremap ,, <Esc>A,<Esc> 
" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv
"Blade Go To View
nnoremap gv :GoBlade<CR>
"Floaterm
nnoremap <silent> <C-t> :FloatermToggle<CR>
tnoremap <silent> <C-t> <C-\><C-n>:FloatermToggle<CR>
let g:floaterm_wintype = 'split'
let g:floaterm_height=0.3
" FZF
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>h :History<CR>
" LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>
" namespace resolver import namespace Ctrl-n
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <C-n> <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php nnoremap <C-n> :call PhpInsertUse()<CR>

nnoremap <leader>nf :AdvancedNewFile<CR>
" COC Config ***************************************************/

"Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

:set updatetime=300
" COC go to definition
nnoremap gd :call CocActionAsync('jumpDefinition')<CR>
"COC autocomplete select autocomplete <Tab> in insert mode
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

" *************************************************************/
"" Vim Options ***********************************************/
:set autoindent
:set tabstop=4
:set relativenumber
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set hidden
:set signcolumn=yes
:set termguicolors
:set cursorline
:set clipboard+=unnamedplus
:set scrolloff=5
:set nowrap
" ************************************************************/
" Plugins that require Lua Config ***************************/
lua << EOF
require('notify').setup({
	background_colour = "#000000",
})
-- noice config
require('noice').setup()
-- popui
vim.ui.select = require"popui.ui-overrider"
vim.ui.input = require"popui.input-overrider"
--Lualine
local colors = {
  red = '#ca1243',
  grey = '#a0a1a7',
  black = '#383a42',
  white = '#f3f3f3',
  light_green = '#8fff6d',
  orange = '#fe8019',
  green = '#8ec07c',
  theme = '#1a1b2a' -- set to theme background or bufferline background
}

local theme = {
  normal = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.theme }, --here
    z = { fg = colors.white, bg = colors.black },
  },
  insert = { a = { fg = colors.black, bg = colors.light_green } },
  visual = { a = { fg = colors.black, bg = colors.orange } },
  replace = { a = { fg = colors.black, bg = colors.green } },
}

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.theme, bg = colors.theme } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

require('lualine').setup {
  options = {
    theme = theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = process_sections {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
        diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
      },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
        diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
      },
      { 'filename', file_status = false, path = 1 },
      { modified, color = { bg = colors.red } },
      {
        '%w',
        cond = function()
          return vim.wo.previewwindow
        end,
      },
      {
        '%r',
        cond = function()
          return vim.bo.readonly
        end,
      },
      {
        '%q',
        cond = function()
          return vim.bo.buftype == 'quickfix'
        end,
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { search_result, 'filetype' },
    lualine_z = { '%l:%c', '%p%%/%L' },
  },
  inactive_sections = {
    lualine_c = { '%f %y %m' },
    lualine_x = {},
  },
}
-- neoscroll
require('neoscroll').setup()
-- Bufferline
require("bufferline").setup({
	options = {
		indicator = {
		  icon = ' ',
		},
		show_close_icon = false,
		tab_size = 0,
		max_name_length = 25,
		offsets = {
		  {
			filetype = 'NvimTree',
			text = '  File Explorer',
			highlight = 'StatusLine',
			text_align = 'left',
		  },
		},
		separator_style = 'slant',
		custom_areas = {
		  left = function()
			return {
			  { text = '    ', fg = '#8fff6d' },
			}
		  end,
		},
	  },
	  highlights = {
		fill = {
		  bg = { attribute = 'bg', highlight = 'StatusLine' },
		},
		background = {
		  bg = { attribute = 'bg', highlight = 'StatusLine' },
		},
		tab = {
		  bg = { attribute = 'bg', highlight = 'StatusLine' },
		},
		tab_close = {
		  bg = { attribute = 'bg', highlight = 'StatusLine' },
		},
		close_button = {
		  bg = { attribute = 'bg', highlight = 'StatusLine' },
		  fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
		},
		close_button_visible = {
		  bg = { attribute = 'bg', highlight = 'StatusLine' },
		  fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
		},
		close_button_selected = {
		  fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
		},
		buffer_visible = {
		  bg = { attribute = 'bg', highlight = 'StatusLine' },
		},
		modified = {
		  bg = { attribute = 'bg', highlight = 'StatusLine' },
		},
		modified_visible = {
		  bg = { attribute = 'bg', highlight = 'StatusLine' },
		},
		duplicate = {
		  bg = { attribute = 'bg', highlight = 'StatusLine' },
		},
		duplicate_visible = {
		  bg = { attribute = 'bg', highlight = 'StatusLine' },
		},
		separator = {
		  fg = { attribute = 'bg', highlight = 'StatusLine' },
		  bg = { attribute = 'bg', highlight = 'StatusLine' },
		},
		separator_selected = {
		  fg = { attribute = 'bg', highlight = 'StatusLine' },
		  bg = { attribute = 'bg', highlight = 'Normal' }
		},
		separator_visible = {
		  fg = { attribute = 'bg', highlight = 'StatusLine' },
		  bg = { attribute = 'bg', highlight = 'StatusLine' },
		},
	  },
})
-- Git Integration
require('gitsigns').setup()
-- Nvim Tree Config
require('nvim-tree').setup({
  git = {
    ignore = false,
  },
  renderer = {
    highlight_opened_files = '1',
    group_empty = true,
    icons = {
      show = {
        folder_arrow = false,
      },
    },
    indent_markers = {
      enable = true,
      -- inline_arrows = false,
    },
  },
  update_cwd = true,
  update_focused_file = {
	  enable = true,
	  update_cwd = true,
	},
})

vim.cmd([[
  highlight NvimTreeIndentMarker guifg=#30323E
  augroup NvimTreeHighlights
    autocmd ColorScheme * highlight NvimTreeIndentMarker guifg=#30323E
  augroup end
]])
-- indent blankline
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
	show_end_of_line = true,
	space_char_blankline = " ",
}
-- treesitter 
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

EOF
