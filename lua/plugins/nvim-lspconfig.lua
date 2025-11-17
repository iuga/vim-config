return {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        vim.lsp.config("gopls", {
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
        vim.lsp.config("golangci_lint_ls", {
            capabilities = capabilities,
        })
        vim.lsp.config("pylsp", {
            capabilities = capabilities,
            settings = {
                pylsp = {
                    plugins = {
                        -- formatter options
                        black = { enabled = true},
                        autopep8 = { enabled = false },
                        yapf = { enabled = false },
                        -- linter options
                        pycodestyle = { enabled = true, ignore = {'E501', 'E231'}, maxLineLength = 120},
                        pylint = {
                            enabled = true,
                            executable = "pylint",
                            args = {
                                "--ignore-long-lines", -- long lines
                                "--disable=E501", -- line too long
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
                map('<leader>r', vim.lsp.buf.rename, '[R]ename Variable')
            end,
        })
    end
}
