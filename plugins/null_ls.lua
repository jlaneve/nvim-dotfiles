local null_ls = require "null-ls"
local b = null_ls.builtins
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {
    b.formatting.prettier,

    -- go
    b.formatting.goimports,
    b.formatting.gofmt,

    -- javascript
    b.formatting.prettier,
    b.formatting.eslint_d,

    -- Lua
    b.formatting.stylua,
    b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

    -- Shell
    b.formatting.shfmt,
    b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

local M = {}

M.setup = function()
    null_ls.setup {
        debug = true,
        sources = sources,

        -- format on save
        on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                        vim.lsp.buf.formatting_sync(nil, 2500)
                    end,
                })
            end
        end,
     }
end

return M
