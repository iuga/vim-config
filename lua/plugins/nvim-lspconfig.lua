return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        lspconfig.gopls.setup({
            on_attach = function(client, bufnr)
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
                local bufopts = { noremap=true, silent=true, buffer=bufnr }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set('n', 'cd', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
            end,
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
        })
        lspconfig.golangci_lint_ls.setup({})
        lspconfig.pylsp.setup({
            settings = {
                pylsp = {
                    plugins = {
                        -- formatter options
                        black = { enabled = true },
                        autopep8 = { enabled = false },
                        yapf = { enabled = false },
                        -- linter options
                        pycodestyle = { enabled = true, ignore = {'E501', 'E231'}, maxLineLenght=120 },
                        pylint = {
                            enabled = true,
                            executable = "pylint",
                            args = {
                                "--disable=C0301", -- line too long
                                "--disable=C0114", -- missing module docstring
                                "--disable=C0116"  -- missing function or method docstring
                            }
                        },
                        pyflakes = { enabled = false },
                        -- type checker
                        pylsp_mypy = { enabled = true },
                        -- auto-completion options
                        jedi_completion = { fuzzy = true },
                        -- import sorting
                        pyls_isort = { enabled = true },
                    },
                },
            },
        })
        
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc)
                    vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
                map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
                map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
                map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
                map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
                map('K', vim.lsp.buf.hover, 'Hover Documentation')
                map('<leader>f', vim.lsp.buf.format, '[F]ormat Buffer')
            end,
        })
    end
}
