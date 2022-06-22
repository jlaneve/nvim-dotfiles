vim.cmd([[ set pumheight=16 ]])

-- remap tab to C-J
vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
