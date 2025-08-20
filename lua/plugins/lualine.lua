return   {
  "nvim-lualine/lualine.nvim",
  dependencies = {
        "jesseleite/nvim-noirbuddy",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("lualine").setup {
            options = {
                icons_enabled = true,
                theme = "kanso",
                filetype = { colored = false },
                component_separators = { left = "", right = "" },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {},
                always_divide_middle = true,
            }
        }
    end,
}
