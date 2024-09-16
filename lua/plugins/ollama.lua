return {
  "nomnivore/ollama.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  -- All the user commands added by the plugin
  cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

  keys = {
    -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
    {
      "<leader>oo",
      ":<c-u>lua require('ollama').prompt()<cr>",
      desc = "ollama prompt",
      mode = { "n", "v" },
    },

    -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
    {
      "<leader>oG",
      ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
      desc = "ollama Generate Code",
      mode = { "n", "v" },
    },
  },

  ---@type Ollama.Config
  opts = {
    -- your configuration overrides
    model = "llama3.1",
    -- View the actual default prompts in ./lua/ollama/prompts.lua
    prompts = {
      Generate_Docstring = {
        prompt = "Generate a $ftype brief an concise docstring for the following variable or method: $sel",
        input_label = "> ",
        model = "llama3.1",
        action = "display",
      },
      Just_For_Func = {
        prompt = "You are a master golang programmer. You know all the concepts and you explain them with simple terms and examples. All the code you present is commented and follows the best practices and conventions: $input",
        input_label = "> ",
        model = "llama3.1",
        action = "display",
      },
      Fix_Grammar = {
        prompt = "Fix grammar for the text below. Be proffesional but consice:\n$sel",
        model = "llama3.1",
        action = "display",
      }
    }
  }
}
