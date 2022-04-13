" init.vim 
" Tommy Janna

" Enable line numbers by default
set number
set relativenumber
nmap <C-k> :set number! relativenumber!<Return>

set showcmd
set wildmenu        " Autocomplete for the command menu
set lazyredraw      " Redraw screen only when necessary

set hlsearch                                                           " Highlight all matches when finding
nnoremap <silent> <C-L> <C-L>:nohlsearch<CR>:match<CR>:diffupdate<CR>  " Clear highlights

" Reassign normal mode
imap jk <Esc>
" Treats a single line wrapped onto multiple lines, as multiple lines.
nnoremap j gj
nnoremap k gk
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
nmap <C-s> :setlocal spell!<Return>
imap <C-s> <Esc>:setlocal spell!<Return>:call Insert()<Return>

" Compile script
nmap <C-c> :w <bar> :!compile %<Return><Return>
imap <C-c> <Esc>:w <bar> :!compile %<Return><Return>:call Insert()<Return>

" Run/Preview script
nmap <C-p> :!run %<Return><Return>

" Switch files (source/header)
nmap <C-h> :w<Return>:call Switch()<Return>
imap <C-h> <Esc>:w<Return>:call Switch()<Return>

" Disable line numbers when using :terminal
au TermOpen * setlocal nonumber norelativenumber

" Remember line when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Add triangle brackets to auto-pairs
" let g:AutoPairs={'(':')', '[':']', '{':'}', '<':'>', "'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}

""" Begin vim-plug plugin manager
call plug#begin()

" Any valid git URL is allowed
" Shorthand notation; fetches https://github.com/user/repo
Plug 'preservim/nerdtree'

" Initialize plugin system
call plug#end()

""" Plugin keybinds
" NERDTree
nmap <leader>n :NERDTreeToggle<Return>

