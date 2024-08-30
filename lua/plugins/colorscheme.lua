return {
  -- catppuccin
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },
  -- GruvBox
  { "ellisonleao/gruvbox.nvim" },
  { "sainnhe/gruvbox-material" },
  -- Noir Buddy
  {
    'jesseleite/nvim-noirbuddy',
    dependencies = {{ 'tjdevries/colorbuddy.nvim' }},
    lazy = false,
    priority = 1000,
    config = function()
		require("noirbuddy").setup({
		preset = 'miami-nights',
		styles = {
				italic = true,
				bold = true,
				underline = true,
				undercurl = true,
			},
			colors = {
    			background = '#121212',
			},
		})
	end,
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
        colorscheme = "vim-noirbuddy"
        -- colorscheme = "gruvbox",
      -- colorscheme = "gruvbox-material",
      -- colorscheme = "catppuccin-macchiato",
      -- colorscheme = "catppuccin-frappe",
    },
  }
}
