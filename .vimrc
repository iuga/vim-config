set nocompatible
set fileformats=unix,dos,mac
set number

syntax on
filetype on
syntax enable
set autoread "Reload files changed outside vim
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

"Theme
" use 256 colors when possible
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
    let &t_Co = 256
    "colorscheme fisa
    "colorscheme Tomorrow-Night
    set background=dark
    let g:gruvbox_contrast_dark='hard'
    let g:gruvbox_italic=0
    colorscheme gruvbox
    if g:colors_name == "gruvbox"
        highlight Normal ctermbg=0 guibg=#000000
    endif
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
set listchars=eol:¬,tab:>-,trail:·,extends:>,precedes:<
set list

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
Bundle 'airblade/vim-gitgutter'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'scrooloose/nerdtree'
Bundle 'morhetz/gruvbox'
Bundle 'tmhedberg/SimpylFold'
Bundle 'tpope/vim-fugitive'
call vundle#end()
filetype plugin indent on

" Airline configuration
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
"let g:airline_theme = 'bubblegum'
"let g:airline_theme = 'tomorrow'
let g:airline_theme = 'gruvbox'
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

" Git Gutter
let g:gitgutter_sign_column_always = 1

" Control P
let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': ['<c-t>'], 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'], }
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/.cov/*,*/conda/*,*/venv/*,*/datasets/*
let g:ctrlp_cmd = 'CtrlPMixed'

" Open the File Explorer: netrw
"let g:netrw_liststyle = 3 " Use a tree style listing of our directories
"let g:netrw_banner = 0
"map <C-\> :20Lexplore<CR>
"let g:netrw_browse_split=4      " Open file in previous buffer
"let g:netrw_list_hide='.*\.swp$,.*\.pyc,__pycache__'
"let g:netrw_altv = 1 " Then we’ll make it open the file in the previous window to the right of the project drawer

" NERDTree Tabs
map <C-\> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Add keyboard shortcuts
nmap <C-t> :tabnew<cr>

" Copy and Paste to the Clipboard
vmap <C-c> :w !pbcopy<cr><cr>
vmap <C-v> <esc>:set paste<cr>:r !pbpaste<cr>:set nopaste<cr>
"nmap <C-v> <esc>:set paste<cr>:r !pbpaste<cr>:set nopaste<cr>
imap <C-v> <esc>:set paste<cr>:r !pbpaste<cr>:set nopaste<cr>

" Move between tabs Shift-[left arrow key] and Shift-[right arrow key]
map <S-Right> :tabn<cr>
map <S-Left>  :tabp<cr>
"map <S-Right> :bn<cr>
"map <S-Left>  :bp<cr>

" Shorcut to save the document
noremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> :update<CR>
inoremap <silent> <C-s> :update<CR>

" Find in all files with grep ( You need ack installed )
nmap <C-f> :Ack --ignore-dir=venv
nmap <C-S-f> :Ack --ignore-dir=venv <cword><CR>

" Move between splits:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Code Folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1
nnoremap <space> za
