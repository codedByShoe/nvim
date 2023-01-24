" Vim Plug *************************************************/
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'unblevable/quick-scope'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'ryanoasis/vim-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'https://github.com/universal-ctags/ctags'
Plug 'ap/vim-css-color'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-surround'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'glepnir/dashboard-nvim'
Plug 'wakatime/vim-wakatime'
Plug 'justinmk/vim-sneak'
Plug 'https://github.com/nvim-tree/nvim-web-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'xiyaowong/nvim-transparent'
Plug 'kdheepak/lazygit.nvim'
Plug 'jwalton512/vim-blade'
" Plug 'https://github.com/ludovicchabant/vim-gutentags'

call plug#end()
" **********************************************************/
" Plugin Vimscript Config *********************************/
" Airline
let g:airline_theme='base16_spacemacs'
let g:airline_powerline_fonts = 1
let g:transparent_enabled = v:true
" IndentLine
let g:indentLine_fileTypeExclude = ['dashboard']
colorscheme tokyonight-moon
" **********************************************************/
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
" Delete Current Buffer
nnoremap <leader>c :bd<CR>
" No highlight after search
nnoremap <leader>l :noh<CR>
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
" Keep cursor in middle of screen when moving half page
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv
"Floaterm
nnoremap <silent> <C-t> :FloatermToggle<CR>
tnoremap <silent> <C-t> <C-\><C-n>:FloatermToggle<CR>
let g:floaterm_wintype = 'float'
" FZF
nnoremap <leader>f :Files<CR>
nnoremap <leader>h :History<CR>
" DashBoard
nnoremap <leader>; :Dashboard<CR>
" LazyGit
nnoremap <silent> <leader>g :LazyGit<CR>
" namespace resolver import namespace <leader>u
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
" COC go to definition
nnoremap <leader>gd :call CocActionAsync('jumpDefinition')<CR>
"COC autocomplete select autocomplete <Tab> in ins mode
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

" *************************************************************/
"" Vim Options ***********************************************/
:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set hidden
:set signcolumn=yes
:set lazyredraw
:set termguicolors
:set cursorline
:set clipboard+=unnamedplus
:set scrolloff=5
:set nowrap
" ************************************************************/
" Plugins that require Lua Config ***************************/
lua << EOF
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
			text = '  Files',
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
-- Git Intergration
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
  git_hl = 1,
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
-- Dashboard
local db = require('dashboard')

db.custom_header = {
'',                                                             
'',                                                             
'   ▄   ▄███▄   ████▄     ▄   ▄█ █▀▄▀█',
'    █  █▀   ▀  █   █      █  ██ █ █ █', 
'██   █ ██▄▄    █   █ █     █ ██ █ ▄ █', 
'█ █  █ █▄   ▄▀ ▀████  █    █ ▐█ █   █', 
'█  █ █ ▀███▀           █  █   ▐    █ ', 
'█   ██                  █▐        ▀  ', 
'                        ▐            ',
'',
'',
'',
}

db.custom_center = {
  { icon = '  ', desc = 'New file                       ', action = 'enew' },
  { icon = '  ', shortcut = 'SPC f', desc = 'Find file                 ', action = 'Files' },
  { icon = '  ', shortcut = 'SPC h', desc = 'Recent files              ', action = 'History' },
}

db.custom_footer = { '' }

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
