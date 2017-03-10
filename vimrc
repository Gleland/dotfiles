execute pathogen#infect()
filetype plugin indent on
syntax on
set number
"airline theme
let g:airline_theme='murmur'
let g:airline_powerline_fonts = 1
colorscheme lucario  
:hi Visual ctermbg=166 ctermfg=black 
"Use the system clipboard
set clipboard=unnamed
set nocompatible
"Always show cursor
set ruler
"Show uncomplete commands
set incsearch
"Highlight search matches
set hlsearch
"convert tabs to spaces
set expandtab
"Set tab size in spaces (this is for manual indenting)
set tabstop=2
"Always show status bar
set laststatus=2
" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu
"Highlight  matching [{()}] when cursor is placed on start/end character
set showmatch

"easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
"shows invisible characters
set listchars=tab:▸\ ,eol:¬
" Source the vimrc file after saving it
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
