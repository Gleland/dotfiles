" Vim-plug for plugins
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'joshdick/onedark.vim'
    Plug 'vim-airline/vim-airline'
call plug#end()

syntax on
set background=dark
let g:onedark_terminal_italics=1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 2
let g:airline_theme ='onedark'
colorscheme onedark 
set clipboard=unnamed
set splitright
set splitbelow
set number

set expandtab
set shiftwidth=4
set tabstop=4 
set smartindent

" sets terminal settings to local bash settings
set shell=/bin/bash\ --login

"check fields if changed since recent activity and reload
" check one time after 4s of inactivity in normal mode
au CursorHold * checktime

" =======================================================================
" Key Mappings
map <space> <leader>
map <leader>e :e $MYVIMRC<CR>

" make Y behave sanely
nnoremap Y y$


tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" opens new vsplit with terminal
nnoremap <leader>n  :vsplit <ESC> :terminal <CR>
" saves file
nnoremap <leader>w  :w <CR>
" source $MYVIMRC
nnoremap <leader>s :source $MYVIMRC<cr>

"nnoremap <leader>f :NERDTree <CR>
" Status line from Max Cantor's vimrc
"
"
"set statusline=%!MyStatusLine()



" Custom functions
" =======================================================================
" function! MyStatusLine()
"     let statusline = ""
"     " Filename (F -> full, f -> relative)
"     let statusline .= "%f"
"     " Buffer flags
"     let statusline .= "%( %h%1*%m%*%r%w%) "
"     " File format and type
"     let statusline .= "(%{&ff}%(\/%Y%))"
"     " Left/right separator
"     let statusline .= "%="
"     " Line & column
"     let statusline .= "(%l,%c%V) "
"     " Character under cursor (decimal)
"     " let statusline .= "%03.3b "
"     " Character under cursor (hexadecimal)
"     " let statusline .= "0x%02.2B "
"     " File progress
"     let statusline .= "| %P/%L"
"     " changed color to match primary theme
"     hi statusline ctermbg=71 ctermfg=16
"     hi statusline guibg=green guifg=black
"     return statusline
" endfunction
"
