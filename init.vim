" Vim Plug *************************************************/
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/universal-ctags/ctags'
Plug 'ap/vim-css-color'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'tpope/vim-surround'
Plug 'https://github.com/voldikss/vim-floaterm'
Plug 'justinmk/vim-sneak'
Plug 'https://github.com/nvim-tree/nvim-web-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kdheepak/lazygit.nvim'
Plug 'neoclide/coc.nvim'
Plug 'jwalton512/vim-blade'
Plug 'https://github.com/ludovicchabant/vim-gutentags'

call plug#end()
" **********************************************************/
" Plugin Config *******************************************/
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='base16_spacemacs'
let NERDTreeShowHidden=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

colorscheme tokyonight-moon
hi FloatermBorder guibg=black
" **********************************************************/
" Key Maps ************************************************/
let mapleader = " "

" Basic leader Mappings
nnoremap <leader>s :w<CR>
nnoremap <leader>sq :wq<CR>
nnoremap <leader>q :q<CR>
nnoremap  H :bp<CR>
nnoremap L :bn<CR>
nnoremap <leader>bd :bd<CR>
:imap jk <ESC>
:imap kj <ESC>
" NERDTree 
nnoremap <leader>e :NERDTreeToggle<CR>
" Floaterm
nnoremap <silent> <leader>tt :FloatermToggle<CR>
tnoremap <silent> <leader>tt <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <leader>tn :FloatermNew<CR>
tnoremap <silent> <leader>tn <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <leader>tb :FloatermPrev<CR>
tnoremap <silent> <leader>tb <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <leader>tf :FloatermNext<CR>
tnoremap <silent> <leader>tf <C-\><C-n>:FloatermNext<CR>
" FZF
nnoremap <leader>p :Files<CR>
" LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>
" namespace resolver import namespace <leader>u
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
" COC go to definition
nnoremap <leader>gt :call CocActionAsync('jumpDefinition')<CR>
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
:set guicursor=i:block
" ************************************************************/
