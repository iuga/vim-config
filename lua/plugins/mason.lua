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
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "pylsp", "gopls", "golangci_lint_ls" },
            })
        end
    }
}
