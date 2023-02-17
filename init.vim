"
" General Configuration
"
set title
set number
set mouse=a
set nowrap
set cursorline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set hidden
set ignorecase
set smartcase
set spelllang=en,es
set termguicolors
set nocompatible
filetype off
let mapleader = ","
let g:mapleader = ","
set number 
set clipboard+=unnamedplus

"
" Package Manager on premise 
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
"
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'catppuccin/nvim', { 'as': 'catppuccin' }
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
Bundle 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'neovim/nvim-lspconfig'
Plugin 'hrsh7th/cmp-nvim-lsp'
Plugin 'hrsh7th/cmp-buffer'
Plugin 'hrsh7th/cmp-path'
Plugin 'hrsh7th/cmp-cmdline'
Plugin 'hrsh7th/nvim-cmp'

Plugin 'hrsh7th/cmp-vsnip'
Plugin 'hrsh7th/vim-vsnip'
Plugin 'golang/vscode-go'
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
colorscheme catppuccin-macchiato " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

"
" Shortcuts
"
nmap <C-t> :tabnew<cr>
vmap <C-c> :w !pbcopy<cr><cr>
imap <C-v> <esc>:set paste<cr>:r !pbpaste<cr>:set nopaste<cr>
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
" Correct typical mistakes (capital letters)
"
nmap :W :w
nmap :Q :q
nmap :WQ :wq
nmap :wQ :wq
nmap :Wq :wq
nmap :Rg :rg

"
" Vim Options
"
au VimLeave * :!clear

"
" Airline configuration
"
set laststatus=2
let g:airline_theme='catppuccin'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

"
" Control P
"
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/vendor/*,.git
let g:ctrlp_cmd = 'CtrlPMixed'
nmap <silent> gp :CtrlPFunky<cr>
" QuickFix
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']

"
" nerdtree
"
function! NerdTreeToggleFind()
    if exists("g:nerdtree") && g:nerdtree.isopen()
        NERDTreeClose
    elseif filereadable(expand('%'))
        NERDTreeFind
    else
        NERDTree
    endif
endfunction
nnoremap <c-\> :call NerdTreeToggleFind()<cr>
command Ntf :NERDTreeFind
autocmd bufenter * if (winnr("$") == 1 && exists("b:nerdtree") && b:nerdtree.istabtree()) | q | endif
let nerdtreeignore = ['\.pyc$', '\.pyo$', '__pycache__', '.git']
let nerdtreequitonopen = 1
let nerdtreeminimalui = 1
let nerdtreedirarrows = 1
let nerdtreecustomopenargs={'file':{'where': 't'}}
let nerdtreeshowhidden=1
let nerdtreewinsize=50

"
" vim-go Go Lang
"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
" format with goimports instead of gofmt
let g:go_auto_type_info = 1
let g:go_gopls_enabled = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_imports_autosave = 1
let g:go_metalinter_autosave=0
let g:go_metalinter_command = "golangci-lint"
let g:go_metalinter_enabled = ['gofmt', 'govet', 'gosec', 'unconvert', 'goconst', 'gocyclo']
let g:go_doc_popup_window = 1
nmap <silent> gdb :GoDebugBreakpoint<cr>
nmap <silent> gdr :GoDebugStart<cr>
nmap <silent> gdt :GoDebugTest<cr>
let g:go_debug_mappings = {
    \ '(go-debug-continue)': {'key': 'c', 'arguments': '<nowait>'},
    \ '(go-debug-stop)'    : {'key': 'q'},
    \ '(go-debug-next)'    : {'key': 'n', 'arguments': '<nowait>'},
    \ '(go-debug-step)'    : {'key': 's'},
    \ '(go-debug-print)'   : {'key': 'p'},
\}
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
\ }
let g:go_debug_breakpoint_sign_text = 'B'
autocmd FileType go nmap <leader>t  <Plug>(go-test)

"
" vsnip
"
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)


"
" CMD Autocomplete
"
lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {},
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  require('lspconfig')['gopls'].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
EOF
