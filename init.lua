vim.cmd([[ set pumheight=16 ]])

-- remap tab to C-J
vim.g.copilot_assume_mapped = true
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("")', { expr = true, silent = true })

vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- set up lsp keymaps
local opts = { noremap=true, silent=true }
vim.keymap.set('n', 'K', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
