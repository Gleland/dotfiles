" Vim-plug for plugins
call plug#begin('~/.local/share/nvim/plugged')
    "Plug 'joshdick/onedark.vim'
    "Plug 'NLKNugyen/papercolor-theme'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'rakr/vim-one'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'vim-syntastic/syntastic'
    Plug 'janko/vim-test'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-vinegar'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
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



"show trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufWinLeave * call clearmatches()


set clipboard=unnamed
set splitright
set splitbelow
set number
set lazyredraw " for long macros

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

set ignorecase "Make searching case insensitive
set smartcase " ... unless the query has capital letters

" sets terminal settings to local zsh settings
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

" opens new vsplit with terminal, names the buffer as 'terminal'
nnoremap <leader>n  :vsplit <ESC> :terminal <CR> :keepalt file terminal <CR>
" saves file
nnoremap <leader>w  :w <CR>
" source $MYVIMRC
nnoremap <leader>s :source $MYVIMRC <CR>

" enable cursorline
set cursorline

" Fuzzy file finder
"
nnoremap <Leader>f :Files<cr>
nnoremap <Leader>F :GFiles<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>t :Tags<cr>
nnoremap <Leader>g :Ag<cr>

" Spacing / indentation settings
autocmd FileType ruby   setlocal ts=2 sts=2 sw=2
autocmd FileType python setlocal ts=4 sts=4 sw=4



" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif



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
