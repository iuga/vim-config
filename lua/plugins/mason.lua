return {
    {
        "williamboman/mason.nvim",
        opts = { ensure_installed = { "goimports" } },
        config = function()
            require("mason").setup({})
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "pylsp", "gopls", "golangci_lint_ls" }
            })
        end
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = { "python", "delve" },
                handlers = {
                    function(config)
                        require('mason-nvim-dap').default_setup(config)
                    end,
                    python = function(config)
                        config.adapters = {
                            type = "executable",
                            command = ".venv/bin/python",
                            args = {
                                "-m",
                                "debugpy.adapter",
                            },
                        }
                        require('mason-nvim-dap').default_setup(config)
                    end,
                },
            })
        end
    }
}
