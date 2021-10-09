syntax on

set noerrorbells
set nocompatible
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
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'francoiscabrol/ranger.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tomasiser/vim-code-dark'
call plug#end()


" Use deoplete.
let g:deoplete#enable_at_startup = 1


" this one starts nerdtree on in initial opening
" autocmd VimEnter * NERDTree

" Open Buffer Numbers to switch easily 
nnoremap <F5> :buffers<CR>:buffer<Space>
set confirm
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

" mapping to open nerdtree more easily
nnoremap <C-g> :NERDTreeTabsToggle<CR>
" open ranger like file tree in vscode and show hidden sneaky files
nnoremap <C-b> :Ranger<CR>
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
   \ quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

let NERDTreeShowHidden=1

" open NERDTree with the current file highlightened
let g:NERDTreeHighlightCursorline = 1
let g:nerdtree_sync_cursorline = 1
" autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif


" required line for gruvbox theme 
let g:gruvbox_contrast_dark = 'medium'
" set bg=dark
autocmd VimEnter * colorscheme nord

" to find hidden files like .env 
let $FZF_DEFAULT_COMMAND='find -L'

" FZF key bindings
nnoremap <C-f> :FZF<CR>
let g:fzf_action = {
  \'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" auto source when save
autocmd! bufwritepost .vimrc source %

" auto wrap code, cause i use vertical monitor like a pozer
set wrap
