set nocompatible
set fileformats=unix,dos,mac
set number

syntax on
filetype on
syntax enable
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

"Theme
" use 256 colors when possible
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
    let &t_Co = 256
    colorscheme fisa
else
    colorscheme delek
endif

"File Exploration
let mapleader=" "

" Identation
"filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" Hidden chars
" set listchars=eol:¬,tab:>-,trail:·,extends:>,precedes:<
" set list

" Bundles and Plugins
"
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" :PluginList
" :PluginInstall
" :PluginClean
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'gmarik/vundle'
Bundle 'fisadev/fisa-vim-colorscheme'
Bundle 'kien/ctrlp.vim.git'
Bundle 'ervandew/supertab'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'
call vundle#end()
filetype plugin indent on

" Airline configuration
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

" JSON
autocmd BufNewFile,BufRead *.json set ft=javascript

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:vim_markdown_folding_disabled=1
set nofoldenable

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_flake8_post_args='--ignore=E501,E128,E225,E402,E265'
let g:syntastic_python_flake8_args = "--max-line-length=160"

" Control P
let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': ['<c-t>'], 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'], }
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/.cov/*,*/conda/*,*/venv/*,*/datasets/*

" Open the File Explorer: netrw
let g:netrw_liststyle = 3 " Use a tree style listing of our directories
let g:netrw_banner = 0
map <C-\> :20Lexplore<CR>
let g:netrw_browse_split=4      " Open file in previous buffer
let g:netrw_list_hide='.*\.swp$,.*\.pyc,__pycache__'
let g:netrw_altv = 1 " Then we’ll make it open the file in the previous window to the right of the project drawer

" Add keyboard shortcuts
nmap <C-t> :tabnew<cr>
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Move between tabs Shift-[left arrow key] and Shift-[right arrow key]
map <S-Right> :tabn<cr>
map <S-Left>  :tabp<cr>

" Find in all files with grep ( You need ack installed )
nmap <C-f> :Ack --ignore-dir=venv
nmap <C-S-f> :Ack --ignore-dir=venv <cword><CR>
