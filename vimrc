syntax on
set background=dark
colorscheme default
"highlight LineNr ctermbg=black
set clipboard=unnamed
set splitright
set splitbelow
set number
map <space> <leader>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" shortcut for Ex mode "nnoremap ; :
noremap <C-d> :sh<cr>
" source $MYVIMRC
nnoremap <leader>s :source $MYVIMRC<cr>
set laststatus=2
"relative file path
set statusline=%f
"modified flag
set statusline +=%m 
"left/right separator
set statusline +=%=
"line,column in buffer
set statusline+=%l,%c
hi statusline ctermfg=23
