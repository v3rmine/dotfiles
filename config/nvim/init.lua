-- NOTE: Config mostly based on https://github.com/NvChad/NvChad

require('plugins')

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

-- local coq = require('coq')
local lspconfig = require('lspconfig')

-- Set the Theme
vim.cmd [[colorscheme tokyonight]]

-- Display line numbers
vim.opt.number = true

--
vim.opt.completeopt = 'menu,menuone,noselect'

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true,
})
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
lspconfig.bashls.setup({
  capabilities = capabilities,
})
lspconfig.sumneko_lua.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})
