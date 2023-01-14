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
" Plugin Config *******************************************/

let g:airline_theme='base16_spacemacs'
let g:airline_powerline_fonts = 1
let g:transparent_enabled = v:true

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
" Quick and convenient exit of insert mode
:imap jk <ESC>
:imap kj <ESC>
" Move lines up and down in insert mode
inoremap <A-j> <Esc>:move .+1<CR>==gi
inoremap <A-k> <Esc>:move .-2<CR>==gi
"Easy way of adding commas and semicolons to end of line
inoremap ;; <Esc>A;<Esc> 
inoremap ,, <Esc>A,<Esc> 
" Floaterm
nnoremap <silent> <leader>tt :FloatermToggle<CR>
tnoremap <silent> <leader>tt <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <leader>tn :FloatermNew<CR>
tnoremap <silent> <leader>tn <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <leader>tb :FloatermPrev<CR>
tnoremap <silent> <leader>tb <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <leader>tf :FloatermNext<CR>
tnoremap <silent> <leader>tf <C-\><C-n>:FloatermNext<CR>
let g:floaterm_wintype = 'split'
let g:floaterm_height = 0.2
" FZF
nnoremap <leader>p :Files<CR>
nnoremap <leader>f :History<CR>
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
"" Vim Sets **************************************************/
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
" ************************************************************/
" Plugins that require Lua Config*******************************************/

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
    show_current_context = true,
    show_current_context_start = true,
	show_end_of_line = true,
	space_char_blankline = " ",
}
EOF
