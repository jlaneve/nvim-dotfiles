local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config
   local servers = { "html", "cssls", "gopls", "tsserver", "pyright", "prismals" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = function(client, bufnr)
             attach(client, bufnr)
         end,
         capabilities = capabilities,
      }
   end
end

return M
