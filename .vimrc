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
Plug 'ludovicchabant/vim-gutentags'
Plug 'alvan/vim-closetag'
Plug 'Raimondi/delimitMate'
call plug#end()

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.blade.php, *.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


" Use deoplete.
let g:deoplete#enable_at_startup = 1

" save your fingers, a little grey area between normal and insert mode like a
" gray Jedi scum
:nnoremap <space> i<space><esc>
:nnoremap <TAB> a<space><esc>
:nnoremap ; a;<esc>
:nnoremap <CR> o<esc>

" avoid black universal holes
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]

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
autocmd VimEnter * colorscheme space-vim-dark

" to find hidden files like .env 
let $FZF_DEFAULT_COMMAND='find -L'

" FZF key bindings
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" auto source when save
autocmd! bufwritepost .vimrc source %

" auto wrap code, cause i use vertical monitor like a pozer
set wrap
