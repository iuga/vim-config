return {
    "fatih/vim-go",
    build = ":GoUpdateBinaries",
    config = function()
        vim.g.go_fmt_command = "gofumpt"
    end,
}
