require('plugins')

local lspconfig = require('lspconfig')

vim.cmd [[colorscheme tokyonight]]

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true,
})

lspconfig.bashls.setup{}
lspconfig.sumneko_lua.setup{
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
