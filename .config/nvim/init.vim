" init.vim 
" Tommy Janna

set number
set relativenumber

set showcmd
set wildmenu        " Autocomplete for the command menu
set lazyredraw      " Redraw screen only when necessary

set hlsearch                       " Highlight all matches when finding
noremap <C-l> :nohl<Return><C-l>   " Add highlight remove to <C-l> clear command

" Reassign normal mode
imap jk <Esc>
" Treats a single line wrapped onto multiple lines, as multiple lines.
noremap j gj
noremap k gk
" Adjust accordingly for skipping multiple lines
noremap <expr> j (v:count? 'j' : 'gj')
noremap <expr> k (v:count? 'k' : 'gk')

" Spacing
set backspace=2     " Backspace will work like normal editor. See :help bs
set tabstop=4       " Show tabs using 4 spaces
set softtabstop=4   " Uses 4 space when using backspace
set shiftwidth=4    " When indenting using >, use 4 spaces
set expandtab       " When tab is pressed, insert 4 spaces.
filetype indent on
" Able to retab a file with spaces using :%retab

" After breaking out of insert mode, return
function! Insert()
    call feedkeys("a")
endfunction

" Switch between .c/.cpp/.cc and .h
function! Switch()
    let basename = expand("%:r")
    let extension = expand("%:e")

    if extension == "h"
        if !empty(glob(basename . ".c"))
            execute "edit" basename . ".c"
        elseif !empty(glob(basename . ".cpp"))
            execute "edit" basename . ".cpp"
        elseif !empty(glob(basename . ".cc"))
            execute "edit" basename . ".cc"
        endif
    elseif extension == "c" || extension == "cpp" || extension == "cc"
        if !empty(glob(basename . ".h"))
            execute "edit" basename . ".h"
        endif
    endif
endfunction

" Toggle spell check
noremap <C-s> :setlocal spell!<Return>
inoremap <C-s> <Esc>:setlocal spell!<Return>:call Insert()<Return>

" Compile script
noremap <C-c> :w <bar> :!compile %<Return><Return>
inoremap <C-c> <Esc>:w <bar> :!compile %<Return><Return>:call Insert()<Return>

" Run/Preview script
noremap <C-p> :!run %<Return><Return>

" Switch files (source/header)
noremap <C-h> :w<Return>:call Switch()<Return>
inoremap <C-h> <Esc>:w<Return>:call Switch()<Return>

" Disable line numbers when using :terminal
autocmd TermOpen * setlocal nonumber norelativenumber

""" Begin vim-plug plugin manager
" Automated vim-plug install
" if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

" Specify a directory for plugins
" call plug#begin('~/.vim/plugged')

" let g:plug_timeout=240   " Increase timeout duration to copmlete YCM download.

" Any valid git URL is allowed
" Shorthand notation; fetches https://github.com/user/repo
" Plug 'user/repo'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Plug 'jiangmiao/auto-pairs'
" Plug 'morhetz/gruvbox'

" Initialize plugin system
" call plug#end()

" Add triangle brackets to auto-pairs
" let g:AutoPairs={'(':')', '[':']', '{':'}', '<':'>', "'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}

" Colours
" set termguicolors
" set background=dark
" colorscheme gruvbox
" let g:gruvbox_termcolors=16
" let g:gruvbox_contrast='soft'
