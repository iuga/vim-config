return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    keys = {
        {
            "<leader>fe",
            function()
                require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
            end,
            desc = "Explorer NeoTree (Root Dir)",
        },
        {
            "<leader>fE",
            function()
                require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
            end,
            desc = "Explorer NeoTree (cwd)",
        },
        { 
            "<leader>e", "<leader>fe", 
            desc = "Explorer NeoTree (Root Dir)", 
            remap = true 
        },
        { 
            "<leader>E", "<leader>fE", 
            desc = "Explorer NeoTree (cwd)", 
            remap = true 
        },
        {
            "<leader>ge",
            function()
                require("neo-tree.command").execute({ source = "git_status", toggle = true })
            end,
            desc = "Git Explorer",
        },
        {
            "<leader>be",
            function()
                require("neo-tree.command").execute({ source = "buffers", toggle = true })
            end,
            desc = "Buffer Explorer",
        },  { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    },
    opts = {
        sources = { "filesystem", "buffers", "git_status" },
        open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
        filesystem = {
            bind_to_cwd = false,
            follow_current_file = { enabled = true },
            use_libuv_file_watcher = true,
        }
    }
}
