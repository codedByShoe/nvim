call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'https://github.com/jiangmiao/auto-pairs'
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
Plug 'neoclide/coc.nvim'

call plug#end()

" Plugin Config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='simple'
let NERDTreeShowHidden=1

:colorscheme afterglow

hi FloatermBorder guibg=black

" Key Maps
let mapleader = " "

nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>sq :wq<CR>
nnoremap <leader>q :q<CR>
nnoremap  H gT
nnoremap L gt
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>
:imap jk <ESC>
:imap kj <ESC>
nnoremap <silent> <leader>tt :FloatermToggle<CR>
tnoremap <silent> <leader>tt <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <leader>tn :FloatermNew<CR>
tnoremap <silent> <leader>tn <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <leader>tb :FloatermPrev<CR>
tnoremap <silent> <leader>tb <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <leader>tf :FloatermNext<CR>
tnoremap <silent> <leader>tf <C-\><C-n>:FloatermNext<CR>
nnoremap <leader>p :Files<CR>
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

"" Vim Sets
:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set hidden
