return {
    "github/copilot.vim",
    config = function()
        -- Disable Copilot's default <Tab> mapping
        vim.g.copilot_no_tab_map = true
        -- Use Shift+Tab to accept Copilot suggestion
        vim.api.nvim_set_keymap("i", "<C-Enter>", "copilot#Accept('<CR>')", { silent = true, expr = true })
    end,
}
