return {
    {
        "williamboman/mason.nvim",
        opts = { ensure_installed = { "goimports", "gofumpt", "gomodifytags", "impl", "delve" } },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "pylsp", "tsserver", "gopls" }
            })
        end
    }
}
