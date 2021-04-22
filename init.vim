"
" General Configuration
"
set title
set number
set mouse=a
set nowrap
set cursorline
set colorcolumn=80
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set hidden
set ignorecase
set smartcase
set spell
set spelllang=en,es
set termguicolors
set nocompatible
filetype off
let mapleader = ","
let g:mapleader = ","

"
" Package Manager on premise 
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
"
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'sonph/onehalf', { 'rtp': 'vim' }
Plugin 'vim-airline/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Bundle 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'vim-syntastic/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'andrewstuart/vim-kubernetes'
Plugin 'scrooloose/nerdtree'
Plugin 'yssl/QFEnter'
"Plugin 'sebdah/vim-delve'

" Under Testing
Plugin 'liuchengxu/graphviz.vim'
Plugin 'jremmen/vim-ripgrep'

call vundle#end()
filetype plugin indent on

"
" About the editor
"
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

"
" Theme
"
set background=dark
syntax on
set t_Co=256
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

"
" Airline configuration
"
set laststatus=2
let g:airline_theme='onehalfdark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline#extensions#whitespace#enabled = 0

"
" Control P
"
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/vendor/*
let g:ctrlp_cmd = 'CtrlPMixed'
nmap <silent> gp :CtrlPFunky<cr>
" QuickFix
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']

"
" NERDTree
"
function! NerdTreeToggleFind()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    elseif filereadable(expand('%'))
        NERDTreeFind
    else
        NERDTree
    endif
endfunction
nnoremap <C-\> :call NerdTreeToggleFind()<CR>
command NTF :NERDTreeFind
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}

"
" Shortcuts
"
" Add keyboard shortcuts
nmap <C-t> :tabnew<cr>
" Copy and Paste to the Clipboard
vmap <C-c> :w !pbcopy<cr><cr>
imap <C-v> <esc>:set paste<cr>:r !pbpaste<cr>:set nopaste<cr>
" Move between tabs Shift-[left arrow key] and Shift-[right arrow key]
map <S-Right> :tabn<cr>
map <S-Left>  :tabp<cr>
" Move Lines Up or Down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
" Shorcut to save the document
noremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> :update<CR>
" Move between splits:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Redraw the screen
nnoremap <silent> <C-l> :nohl<CR> :SyntasticReset<CR> :cclose<CR><C-l>

"
" Go Lang
"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_fmt_command = "goimports"
nmap <silent> gdb :GoDebugBreakpoint<cr>

"
" Auto Completion
"
inoremap <silent><expr> <c-space> coc#refresh()
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Go To code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"
" Syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
nnoremap <silent> <C-e> :SyntasticReset<Cr>
let g:syntastic_python_checkers = ['flake8']
" (E501) Line too long (82 &gt; 79 characters) 
let g:syntastic_python_flake8_post_args='--ignore=E501'

"
" RipGrep RG ( Search in Project )
"
let g:rg_command = 'rg --vimgrep -S'
nnoremap <C-f> :Rg<Cr>
map <leader>f :Rg<Cr>

"
" Correct typical mistakes (capital letters)
"
nmap :W :w
nmap :Q :q
nmap :WQ :wq
nmap :wQ :wq
nmap :Wq :wq

