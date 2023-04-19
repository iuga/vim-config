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
let mapleader = " "
let g:mapleader = " "
set number 
set nu rnu
set clipboard+=unnamedplus
set foldmethod=indent
set foldlevelstart=99
set foldclose=all

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
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'tacahiroy/ctrlp-funky'
"Plugin 'scrooloose/nerdtree'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'fatih/vim-go'
"Bundle 'airblade/vim-gitgutter'
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

Plugin 'petobens/poet-v'
Plugin 'psf/black', { 'branch': 'stable' }
Plugin 'fisadev/vim-isort'

Plugin 'earthly/earthly.vim', { 'branch': 'main' }

Plugin 'jremmen/vim-ripgrep'
Plugin 'lewis6991/gitsigns.nvim'

Plugin 'nvim-neo-tree/neo-tree.nvim'
Plugin 'MunifTanjim/nui.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
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
nnoremap <silent> <C-l> :nohl<CR> :cclose<CR><C-l>


"
" Correct typical mistakes (capital letters)
"
nmap :W :w
nmap :Q :q
nmap :WQ :wq
nmap :wQ :wq
nmap :Wq :wq
nmap :rg :Rg

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
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1

"
" Control P
"
"let g:ctrlp_prompt_mappings = {
"    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
"    \ 'AcceptSelection("t")': ['<cr>'],
"    \ }
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_dont_split = 'NERD' " Close NERDTree window
"let g:ctrlp_cmd = ':NERDTreeClose\|CtrlPMixed'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/vendor/*,.git
"nmap <silent> gp :CtrlPFunky<cr>

"
" QuickFix
"
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']

"
" NeoTree
"
" nnoremap <c-\> :NeoTreeShowToggle<cr>
nnoremap <c-\> :Neotree source=filesystem reveal=true position=left toggle=true<cr>


"
" nerdtree
"
"function! NerdTreeToggleFind()
"    if exists("g:NERDTree") && g:NERDTree.IsOpen()
"        NERDTreeClose
"    elseif filereadable(expand('%'))
"        NERDTreeFind
"    else
"        NERDTree
"    endif
"endfunction
"nnoremap <c-\> :call NerdTreeToggleFind()<cr>
"command Ntf :NERDTreeFind
"" How can I close Vim or a tab automatically when NERDTree is the last window?
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.IsTabTree()) | q | endif
"" Open the existing NERDTree on each new tab.
"" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
"let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '__pycache__', '.git']
"let NERDTreeQuitOnOpen = 1
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1
"let NERDTreeCustomOpenArgs={'file':{'where': 't'}}
"let NERDTreeShowHidden=1
"let NERDTreeWinSize=45

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
" let g:go_fmt_command = "goimports"
let g:go_fmt_command = "gofmt"
let g:go_fmt_autosave = 1
let g:go_imports_autosave = 1
let g:go_metalinter_autosave=0
let g:go_metalinter_command = "golangci-lint"
" let g:go_metalinter_enabled = ['gofmt', 'govet', 'gosec', 'unconvert', 'goconst', 'gocyclo']
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
let g:go_debug_breakpoint_sign_text = '>'
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
" RipGrep RG ( Search in Project )
"
let g:rg_command = 'rg --vimgrep -S'
map <leader>f :Rg<Cr>

"
" Telescope Find files using Telescope command-line sugar.
"
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope lsp_references<cr>
nnoremap <leader>fi <cmd>Telescope lsp_incoming_calls<cr>
nnoremap <leader>fs <cmd>Telescope lsp_document_symbols<cr>

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

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    end

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  require('lspconfig')['gopls'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
    init_options = {
        usePlaceholders = true,
    }
  }
  require('lspconfig')['pyright'].setup {
      on_attach = on_attach,
      capabilities = capabilities
  }
  require('gitsigns').setup()
  require("neo-tree").setup({
    event_handlers = {

        {
        event = "file_opened",
        handler = function(file_path)
            --auto close
            require("neo-tree").close_all()
        end
        },
    }
  })

EOF
