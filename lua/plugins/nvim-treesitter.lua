return { -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "bash", "html", "lua", "markdown", "vim", "vimdoc", "python", "css", "terraform", "dockerfile", "go", "zig"},
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
