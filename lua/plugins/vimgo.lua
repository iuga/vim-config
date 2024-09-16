return {
    "fatih/vim-go",
    lazy = false,
    config = function()
        -- require("vim-go").setup({})
    end,
    keys = {
        {
            "<leader>rt",
            "GoTestFunc",
            desc = "[R]un Go [T]ests",
        },
    }
}
