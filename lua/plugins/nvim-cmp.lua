return {
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
       "hrsh7th/cmp-vsnip",
       "hrsh7th/vim-vsnip",
       "hrsh7th/cmp-nvim-lsp",
       "hrsh7th/cmp-path",
      },
      config = function()
        local cmp = require("cmp")
        cmp.setup({
          completion = {
            autocomplete = false -- Trigger autocompletion manually
          },
          snippet = {
            expand = function(args)
              vim.fn["vsnip#anonymous"](args.body)
            end,
          },
          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },
          -- Please read `:help ins-completion`, it is really good!
          mapping = cmp.mapping.preset.insert({
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-y>"] = cmp.mapping.confirm({ select = true }),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete({}),
          }),
          sources = {
            { name = "nvim_lsp" },
            { name = "vsnip" },
            { name = "path" },
          },
        })
      end,
     }
}
