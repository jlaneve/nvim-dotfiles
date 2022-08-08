local M = {}

M.nvimtree = {
   git = {
      enable = true,
   },

   renderer = {
       highlight_git = true,
        icons = {
            show = {
                git = true,
            },
        },
    },
}


M.cmp = function()
    local cmp = require "cmp"

    return {
      mapping = {
        ["<CR>"] = cmp.mapping.confirm {
           behavior = cmp.ConfirmBehavior.Replace,
        },
        ["<Tab>"] = cmp.config.disable,
      },
      sources = {
        { name = "luasnip", group_index = 2 },
        { name = "nvim_lsp", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path", group_index = 2 },
      },
    }
end

return M
