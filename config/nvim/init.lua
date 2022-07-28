-- NOTE: Config mostly based on https://github.com/NvChad/NvChad

require('plugins')

local coq = require('coq')
local lspconfig = require('lspconfig')

-- BUG: Workaround till I find how to autostart COQ using Packer 
vim.cmd[[COQnow --shut-up]]
-- Set the Theme
vim.cmd [[colorscheme tokyonight]]

-- Display line numbers
vim.opt.number = true

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true,
})
lspconfig.bashls.setup(coq.lsp_ensure_capabilities())
lspconfig.sumneko_lua.setup(coq.lsp_ensure_capabilities({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}))

local map = vim.api.nvim_set_keymap
-- Rebind to go to the end of the word
map('n', '<C-right>', 'e', { noremap = true, silent = false })
map('i', '<C-right>', '<esc>ea', { noremap = true, silent = false })
-- Rebind to go to the begginning of the word
map('n', '<C-left>', 'b', { noremap = true, silent = false })
map('i', '<C-left>', '<esc>bi', { noremap = true, silent = false })
-- Delete prev word
map('i', '<C-backspace>', '<esc>vbdi', { noremap = true, silent = false })
-- Delete next word
map('i', '<C-del>', '<esc>vedi', { noremap = true, silent = false })
