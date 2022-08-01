-- NOTE: Config mostly based on https://github.com/NvChad/NvChad

require("core")
require("core.options")

vim.defer_fn(function()
  require("core.utils").load_mappings()
end, 0)

require("core.packer").bootstrap()

pcall(require, "custom")

local map = vim.api.nvim_set_keymap

-- Rebind to go to the end of the word
map('n', '<C-right>', 'e', { noremap = true, silent = false })
map('i', '<C-right>', '<esc>ea', { noremap = true, silent = false })
-- Rebind to go to the begginning of the word
map('n', '<C-left>', 'b', { noremap = true, silent = false })
map('i', '<C-left>', '<esc>bi', { noremap = true, silent = false })
-- Delete prev word
map('i', '<C-backspace>', '<esc>vbda', { noremap = true, silent = false })
-- Delete next word
map('i', '<C-del>', '<esc>vedi', { noremap = true, silent = false })
