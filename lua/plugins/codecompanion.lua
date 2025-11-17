local fmt = string.format

return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        cmd = {
            'CodeCompanion',
            'CodeCompanionChat',
            'CodeCompanionToggle',
            'CodeCompanionActions',
        },
        keys = {
            -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
            {
                "<leader>oo",
                ":<c-u>lua require('codecompanion').chat()<cr>",
                desc = "code companion chat",
                mode = { "n", "v" },
            },
            {
                "<leader>oa",
                ":<c-u>lua require('codecompanion').actions()<cr>",
                desc = "code companion actions",
                mode = { "n", "v" },
            },
        },
        config = function()
            require("codecompanion").setup({
                adapters = {},
                strategies = {
                    chat = {
                        adapter = "copilot",
                        model = "claude-sonnet-4.5",
                    },
                    inline = {
                        adapter = "copilot",
                        model = "claude-sonnet-4.5",
                    },
                    agent = {
                        adapter = "copilot",
                        model = "claude-sonnet-4.5",
                    },
                },
                display = {
                    action_palette ={
                        prompt = "", -- Prompt used for interactive LLM calls
                        provider = "telescope", -- default|telescope|mini_pick
                        opts = {
                            show_default_actions = true, -- Show the default actions in the action palette?
                            show_default_prompt_library = true, -- Show the default prompt library in the action palette?
                        },
                    },
                },
                extensions = {
                    mcphub = {
                        callback = "mcphub.extensions.codecompanion",
                        opts = {
                            -- MCP Tools 
                            make_tools = true,              -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
                            show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
                            add_mcp_prefix_to_tool_names = true, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
                            show_result_in_chat = true,      -- Show tool results directly in chat buffer
                            format_tool = nil,               -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
                            make_vars = true,                -- Convert MCP resources to #variables for prompts
                            make_slash_commands = true,      -- Add MCP prompts as /slash commands
                        }
                    },
                },
                prompt_library = {
                    ["Code Review Expert"] = {
                        strategy = "chat",
                        description = "Let's code review the changes",
                        prompts = {
                            {
                                role = "system",
                                content = function(context)
                                    return "I want you to act as a senior " .. context.filetype .. " developer."
                                    .. "It's time to perform a code-review of the changes. Please consider:"
                                    .. "Code readability and structure;"
                                    .. "Potential bugs or edge cases;"
                                    .. "Performance implications;"
                                    .. "Error handling and logging;"
                                    .. "Security concerns;"
                                    .. "Testing and Coverage;"
                                    .. "Code duplication;"
                                    .. "Code clarity and dependencies;"
                                    .. "Typos, Documentation and comments;"
                                    .. "Compliance with coding standards."
                                    .. "Suggest improvements and explain your reasoning for each suggestion."
                                end,
                            },
                            {
                                role = "user",
                                content = function()
                                    return fmt(
                                        [[
Change diff:
```diff
%s
```]],
                                        vim.fn.system("git diff --no-ext-diff --staged")
                                    )
                                end,
                                opts = {
                                    contains_code = true,
                                },
                            },
                        },
                        opts = {
                            auto_submit = true
                        },
                    }
                },
            })
        end,
    },
    -- {
    --     "MeanderingProgrammer/render-markdown.nvim",
    --     ft = { "markdown", "codecompanion" }
    -- },
    -- {
    --     "OXY2DEV/markview.nvim",
    --     lazy = false,
    --     opts = {
    --         preview = {
    --             filetypes = { "markdown", "codecompanion" },
    --             ignore_buftypes = {},
    --         },
    --     },
    -- },
    {
        "echasnovski/mini.diff",
        config = function()
            local diff = require("mini.diff")
            diff.setup({
                -- Disabled by default
                source = diff.gen_source.none(),
            })
        end,
    },
    {
        "ravitemer/mcphub.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        build = "npm install -g mcp-hub@latest",  -- Installs `mcp-hub` node binary globally
        config = function()
            require("mcphub").setup()
        end
    }
}
