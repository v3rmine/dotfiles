local M = {}

M.trouble = function()
  local present, trouble = pcall(require, 'trouble')

  if not present then
    return
  end

  trouble.setup()
end

M.lsp_lines = function()
  local present, lsp_lines = pcall(require, 'lsp_lines')

  if not present then
    return
  end

  lsp_lines.setup()
end

M.lsp_signature = function()
  local present, lsp_signature = pcall(require, 'lsp_signature')

  if not present then
    return
  end

  lsp_signature.setup {
    bind = true,
    handler_opts = {
      border = 'rounded',
    },
    hint_prefix = "🐱 ",
  }
end

M.lsp_utils = function()
  local present = pcall(require, 'lsputil')

  if not present then
    return
  end

  vim.lsp.handlers['textDocument/codeAction'] = require('lsputil.codeAction').code_action_handler
  vim.lsp.handlers['textDocument/references'] = require('lsputil.locations').references_handler
  vim.lsp.handlers['textDocument/definition'] = require('lsputil.locations').definition_handler
  vim.lsp.handlers['textDocument/declaration'] = require('lsputil.locations').declaration_handler
  vim.lsp.handlers['textDocument/typeDefinition'] = require('lsputil.locations').typeDefinition_handler
  vim.lsp.handlers['textDocument/implementation'] = require('lsputil.locations').implementation_handler
  vim.lsp.handlers['textDocument/documentSymbol'] = require('lsputil.symbols').document_handler
  vim.lsp.handlers['workspace/symbol'] = require('lsputil.symbols').workspace_handler
end

M.rust_tools = function()
  local present, rust_tools = pcall(require, 'rust-tools')

  if not present then
    return
  end

  rust_tools.setup()
end

M.typescript_tools = function()
  local present, typescript = pcall(require, 'typescript')

  if not present then
    return
  end

  typescript.setup()
end

return M
