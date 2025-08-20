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
                    },
                    inline = {
                        adapter = "copilot",
                    },
                    agent = {
                        adapter = "copilot",
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
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "codecompanion" }
    },
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        opts = {
            preview = {
                filetypes = { "markdown", "codecompanion" },
                ignore_buftypes = {},
            },
        },
    },
    {
        "echasnovski/mini.diff",
        config = function()
            local diff = require("mini.diff")
            diff.setup({
                -- Disabled by default
                source = diff.gen_source.none(),
            })
        end,
    }
}
