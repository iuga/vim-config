return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
        { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        dashboard = { enabled = false },
        indent = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = false },
        quickfile = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = false },
        words = { enabled = true },
        zen = {
            show = {
                statusline = false,
                tabline = false,
            },
            window = {
                backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                -- height and width can be:
                -- * an absolute number of cells when > 1
                -- * a percentage of the width / height of the editor when <= 1
                -- * a function that returns the width or the height
                width = 220, -- width of the Zen window
                height = 1, -- height of the Zen window
                -- by default, no options are changed for the Zen window
                -- uncomment any of the options below, or add other vim.wo options you want to apply
                options = {
                    -- signcolumn = "no", -- disable signcolumn
                    -- number = false, -- disable number column
                    -- relativenumber = false, -- disable relative numbers
                    -- cursorline = false, -- disable cursorline
                    -- cursorcolumn = false, -- disable cursor column
                    -- foldcolumn = "0", -- disable fold column
                    -- list = false, -- disable whitespace characters
                },
            },
        },
    },
}
