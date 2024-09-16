return {
    {
        "williamboman/mason.nvim",
        opts = { ensure_installed = { "goimports" } },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "pylsp", "gopls", "golangci_lint_ls" }
            })
        end
    }
}
