syntax on
set background=dark
colorscheme lucario
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
nnoremap <leader>n  :vsplit <ESC> :terminal <CR>

" source $MYVIMRC

nnoremap <leader>s :source $MYVIMRC<cr>

" nerd tree always opens in CWD
" =======================================================================


" =======================================================================
" Plugin Settings


" Vim-plug for plugins
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'scrooloose/nerdtree'
call plug#end()


nnoremap <leader>f :NERDTree <CR>
" =======================================================================
" Status line from Max Cantor's vimrc
"
"
set statusline=%!MyStatusLine()



" Custom functions
" =======================================================================
function! MyStatusLine()
    let statusline = ""
    " Filename (F -> full, f -> relative)
    let statusline .= "%f"
    " Buffer flags
    let statusline .= "%( %h%1*%m%*%r%w%) "
    " File format and type
    let statusline .= "(%{&ff}%(\/%Y%))"
    " Left/right separator
    let statusline .= "%="
    " Line & column
    let statusline .= "(%l,%c%V) "
    " Character under cursor (decimal)
    " let statusline .= "%03.3b "
    " Character under cursor (hexadecimal)
    " let statusline .= "0x%02.2B "
    " File progress
    let statusline .= "| %P/%L"
    " changed color to match primary theme
    hi statusline ctermbg=71 ctermfg=16
    hi statusline guibg=green guifg=black
    return statusline
endfunction
