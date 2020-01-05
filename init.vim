" Vim-plug for plugins
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'joshdick/onedark.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'rakr/vim-one'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'vim-syntastic/syntastic'
    Plug 'janko/vim-test'
    Plug 'tpope/vim-fugitive'
call plug#end()

syntax on
set hidden
set background=light
let g:one_allow_italics=1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 2
let g:airline_theme ='one'

colorscheme one " dark

set clipboard=unnamed
set splitright
set splitbelow
set number

set expandtab
set shiftwidth=4
set tabstop=4 
set smartindent

" sets terminal settings to local bash settings
set shell=/bin/zsh\ --login

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
nnoremap <leader>s :source $MYVIMRC <CR>

" Spacing / indentation settings
autocmd FileType ruby   setlocal ts=2 sts=2 sw=2
autocmd FileType python setlocal ts=4 sts=4 sw=4


" FZF 
nnoremap <leader>f :Files <CR>
nnoremap <leader>b :Buffers <CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



" vim-test
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nnoremap ,n :TestNearest<CR>
nnoremap ,f  :TestFile<CR>
"nnoremap ,t :TestSuite<CR>
nnoremap ,t :!pytest<CR>
"nnoremap t<C-g> :TestVisit<CR>
let test#strategy = 'neovim'



" C++ commands
nnoremap ,c :!g++ % <CR> :split <ESC> :terminal <CR> i ./a.out<CR>
