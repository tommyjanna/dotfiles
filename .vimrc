" Tommy Janna
set number
set relativenumber
set showcmd
set wildmenu        " Autocomplete for the command menu
set lazyredraw      " Redraw screen only when necessary
set hlsearch        " Highlight all matches when finding

" Treats a single line wrapped onto multiple lines, as multiple lines.
nnoremap j gj
nnoremap k gk

" Spacing
set backspace=2     " Backspace will behave like normal IDE. See :help bs
set tabstop=4       " Show tabs using 4 spaces
set softtabstop=4   " Uses 4 space when using backspace
set shiftwidth=4    " When indenting using >, use 4 spaces
set expandtab       " When tab is pressed, insert 4 spaces.
filetype indent on
" Able to retab a file with spaces using :%retab

" LaTeX
noremap <C-c> :w <bar> :silent !pdflatex %<Return>
inoremap <C-c> <Esc>:w <bar> :silent !pdflatex %<CR>

""" Begin vim-plug plugin manager
" Automated vim-plug install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

let g:plug_timeout=240   " Increase timeout duration to copmlete YCM download.

" Any valid git URL is allowed
" Shorthand notation; fetches https://github.com/user/repo
" Plug 'user/repo'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

" Add triangle brackets to auto-pairs
let g:AutoPairs={'(':')', '[':']', '{':'}', '<':'>', "'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}

" Colours
set termguicolors
set background=dark
colorscheme gruvbox
let g:gruvbox_termcolors=16
let g:gruvbox_contrast='soft'
