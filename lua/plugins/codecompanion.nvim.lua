local fmt = string.format

return {
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
            adapters = {
                assist = function()
                    return require("codecompanion.adapters").extend("ollama", {
                        name = "assist", -- Give this adapter a different name to differentiate it from the default ollama adapter
                        schema = {
                            model = {
                                default = "qwen2.5-coder:32b",
                            },
                            num_ctx = {
                                default = 16384,
                            },
                            num_predict = {
                                default = -1,
                            },
                        },
                    })
                end,
            },
            strategies = {
                chat = {
                    adapter = "copilot",
                    tools = {
                        ["mcp"] = {
                            -- calling it in a function would prevent mcphub from being loaded before it's needed
                            callback = function() return require("mcphub.extensions.codecompanion") end,
                            description = "Call tools and resources from the MCP Servers",
                        }
                    }
                },
                inline = {
                    adapter = "copilot",
                },
                agent = {
                    adapter = "copilot",
                },
            },
            display = {
                action_palette = {
                    prompt = "", -- Prompt used for interactive LLM calls
                    provider = "telescope", -- default|telescope|mini_pick
                    opts = {
                        show_default_actions = true, -- Show the default actions in the action palette?
                        show_default_prompt_library = true, -- Show the default prompt library in the action palette?
                    },
                },
                --   chat = {
                --     window = {
                --       layout = "vertical", -- float|vertical|horizontal|buffer
                --     },
                --   },
            },
            prompt_library = {
                ["Code Review"] = {
                    strategy = "chat",
                    description = "Let's code review the changes",
                    prompts = {
                        {
                            role = "user",
                            content = function()
                                return fmt(
                                    [[You are an experienced developer and now it's time to perform a code-review of the changes. 
Please consider: Code readability and structure; Performance implications; Error handling and logging; Security concerns; Testing and Coverage; Code duplication; Code clarity and dependencies; Documentation and comments; Compliance with coding standards.
Do not explain what you are going to do, just provide the feedback in bullet points as Markdown.
Be short and consice. Diff of the changes:
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
                        auto_submit = true,
                        adapter = {
                            name = "assist",
                        },
                    },
                }
            },
            -- opts = {
            --   ---@param adapter CodeCompanion.Adapter
            --   ---@return string
            --   system_prompt = function(adapter)
            --     if adapter.schema.model.default == "llama3.1:latest" then
            --       return "My custom system prompt"
            --     end
            --     return "My default system prompt"
            --   end,
            -- },
        })
    end,
}
