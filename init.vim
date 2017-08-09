syntax on
set background=dark
colorscheme primary
highlight LineNr ctermbg=black
set clipboard=unnamed
set splitright
set splitbelow
set number
map <space> <leader>

" sets terminal settings to local bash settings
set shell=/bin/bash\ --login

"check fields if changed since recent activity and reload
" check one time after 4s of inactivity in normal mode
set autoread
au CursorHold * checktime

" =======================================================================
" Key Mappings

tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" shortcut for Ex mode
nnoremap ; :
nnoremap : ;

" opens new vsplit with terminal
nnoremap <leader>n  :vsplit <ESC> :terminal <cr>
" nerd tree always opens in CWD
" =======================================================================


" =======================================================================
" Plugin Settings


" Vim-plug for plugins
call plug#begin('~/.local/share/nvim/plugged')
    "Plug 'dhruvasagar/vim-table-mode'
    "Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'
    Plug 'scrooloose/nerdtree'
call plug#end()
" Airline Theme
let g:airline_theme='papercolor'
nnoremap <leader>f :NERDTree <cr>
" =======================================================================

