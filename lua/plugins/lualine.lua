return   {
  "nvim-lualine/lualine.nvim",
  dependencies = {
        "jesseleite/nvim-noirbuddy",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local noirbuddy_lualine = require("noirbuddy.plugins.lualine")
        local theme = noirbuddy_lualine.theme
        local sections = noirbuddy_lualine.sections
        local inactive_sections = noirbuddy_lualine.inactive_sections

        sections.lualine_c = {{'filename', path = 1}}

        require("lualine").setup {
            options = {
                icons_enabled = true,
                theme = theme,
                filetype = { colored = false },
                component_separators = { left = "", right = "" },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {},
                always_divide_middle = true,
            },
            sections = sections,
            inactive_sections = inactive_sections,
        }
    end,
}
