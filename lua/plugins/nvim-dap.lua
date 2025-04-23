return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
        },
        keys = {
            { "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
            { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
            { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
            { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
            { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
            { "<leader>dn", function() require("dap").step_over() end, desc = "Step Next" },
            { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
            { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
            { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
            { "<leader>dj", function() require("dap").down() end, desc = "Down" },
            { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
            { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
            { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
            { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
            { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
            { "<leader>ds", function() require("dap").session() end, desc = "Session" },
            { "<leader>dq", function() require("dap").terminate() end, desc = "Terminate" },
            { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
            -- { "<leader>dk", function() require("dap").up() end, desc = "Up" },
        },
        config = function()
            -- load mason-nvim-dap here, after all adapters have been setup
            if LazyVim.has("mason-nvim-dap.nvim") then
                require("mason-nvim-dap").setup(LazyVim.opts("mason-nvim-dap.nvim"))
            end
        end
    },

    {
        "leoluz/nvim-dap-go",
        config = function()
            require('dap-go').setup({})
        end,
    },

    {
        "mfussenegger/nvim-dap-python",
        config = function()
            require("dap-python").setup(LazyVim.get_pkg_path("debugpy", "./venv/bin/python"))
        end,
    },

    { 
        "rcarriga/nvim-dap-ui", 
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        keys = {
            {"<leader>dk", function() require("dapui").eval() end, desc = "[D]ebug [E]val"}
        },
        config = function()
            require("dapui").setup({
                layouts = { 
                    {
                        elements = { 
                            { id = "scopes", size = 0.2}, 
                            { id = "stacks", size = 0.2 }, 
                            { id = "watches", size = 0.2 },
                            { id = "breakpoints", size = 0.2 },
                            { id = "repl", size = 0.2 }, 
                        },
                        position = "right",
                        size = 90
                    }, 
                }
            })
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    }
}
