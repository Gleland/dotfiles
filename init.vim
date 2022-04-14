" ===============================================
" Plugins
" ===============================================

" Automatically install vim-plug
" https://github.com/junegunn/vim-plug/wiki/tips
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim')
    Plug 'rakr/vim-one'
    Plug 'tpope/vim-vinegar'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vimwiki/vimwiki'
call plug#end()

au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}
set hidden
set background=light

" color column at 80 chars for reference
set cc=80

let g:one_allow_italics=1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 2
let g:airline_theme ='one'

colorscheme one

"show trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufWinLeave * call clearmatches()

" let's be able to remove it too
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()


set clipboard=unnamed
set splitright
set splitbelow
set number
set lazyredraw " for long macros

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

set ignorecase "Make searching case insensitive
set smartcase " ... unless the query has capital letters

"check fields if changed since recent activity and reload
" check one time after 4s of inactivity in normal mode
set autoread
au CursorHold * checktime

" =======================================================================
" Key Mappings
map <space> <leader>
map <leader>e :e $MYVIMRC<CR>

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

" vim-test
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nnoremap ,n :TestNearest<CR>
nnoremap ,f  :TestFile<CR>
"nnoremap ,t :TestSuite<CR>
nnoremap ,t :!pytest<CR>
"nnoremap t<C-g> :TestVisit<CR>
let test#strategy = 'neovim'


" spell checking
nnoremap <silent> <leader>s :set spell!<CR>

" https://stackoverflow.com/questions/635770/jump-to-function-definition-in-vim
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

 " enable cursorline
 set cursorline

 " Fuzzy file finder
 nnoremap <Leader>f :Files<cr>
 nnoremap <Leader>F :GFiles<cr>
 nnoremap <Leader>b :Buffers<cr>
 "nnoremap <Leader>t :Tags<cr>
 nmap <Leader>t <Plug>VimwikiIndex
 nnoremap <Leader>g :Ag<cr>

" Spacing / indentation settings
autocmd FileType ruby   setlocal ts=2 sts=2 sw=2
autocmd FileType python setlocal ts=4 sts=4 sw=4

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv
