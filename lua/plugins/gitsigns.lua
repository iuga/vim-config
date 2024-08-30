return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup({})

    vim.keymap.set("n", "<leader>gd", gitsigns.preview_hunk_inline, {desc = "[Git] Show hunk diff inline."} )
    vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, {desc = "[Git] Reset current hunk"})
    vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, {desc = "[Git] Blame current line"})
  end
}
