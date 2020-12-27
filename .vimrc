syntax on

set noerrorbells
set nu
set termguicolors
set colorcolumn=80

call plug#begin()
Plug 'preservim/NERDTree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
call plug#end()

" this one starts nerdtree on in initial opening
autocmd VimEnter * NERDTree

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" required line for gruvbox theme 
let g:gruvbox_contrast_dark = 'medium'
" set bg=dark
autocmd VimEnter * colorscheme base16-gruvbox-dark-medium
