return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    keys = {
      -- stylua: ignore
      {
        "<leader>sf",
        function() require("telescope.builtin").find_files() end,
        desc = "[S]earch [F]iles",
      },
      {
        "<leader><leader>",
        function() require("telescope.builtin").builtin() end,
        desc = "[S]earch [S]elect Telescope",
      },
      {
        "<leader>ss",
        function() require("telescope.builtin").lsp_document_symbols() end,
        desc = "[S]earch [S]ymbols",
      },
      {
        "<leader>gs",
        function() require("telescope.builtin").git_status() end,
        desc = "[G]it [S]tatus",
      },
      {
        "<leader>sd",
        function() require("telescope.builtin").diagnostics() end,
        desc = "[S]earch [D]iagnostics",
      },
      {
        "<leader>s.",
        function() require("telescope.builtin").oldfiles() end,
        desc = '[S]earch Recent Files ("." for repeat)',
      },
      {
        "<leader>sb",
        function() require("telescope.builtin").buffers() end,
        desc = '[ ] Find existing buffers',
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-tree/nvim-web-devicons" },
      { "BurntSushi/ripgrep" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_config = {
            vertical = { width = 0.9 },
            horizontal = { width = 0.9 },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })
      -- Enable telescope extensions, if they are installed
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
}
