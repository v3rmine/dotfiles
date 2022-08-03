-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true,
})

local M = {}

M.supported_filetypes = { "sh", "lua", "rust", "nim" }

local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return M
end

local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
  if vim.g.vim_version > 7 then
    -- nightly
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  else
    -- stable
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  local lsp_mappings = utils.load_config().mappings.lspconfig
  utils.load_mappings({ lsp_mappings }, { buffer = bufnr })
end

M.on_attach_virtual_types = function(client, bufnr)
  local vtype_present, virtualtypes = pcall(require, "virtualtypes")

  if not vtype_present then
    return
  end

  virtualtypes.on_attach(client, bufnr)
  M.on_attach(client, bufnr)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

lspconfig.sumneko_lua.setup({
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

lspconfig.bashls.setup({
  on_attach = M.on_attach,
  capabilities = M.capabilities,
})

lspconfig.rust_analyzer.setup({
  on_attach = M.on_attach_virtual_types,
  capabilities = M.capabilities,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy"
      },
      diagnostics = {
        experimental = {
          enable = true,
        },
      },
    },
  },
})

lspconfig.nimls.setup({
  on_attach = M.on_attach_virtual_types,
  capabilities = M.capabilities,
})

-- lspconfig.eslint.setup({
--   on_attach = M.on_attach,
--   capabilities = M.capabilities,
-- })

lspconfig.tsserver.setup({
  on_attach = M.on_attach_virtual_types,
  capabilities = M.capabilities,
})

return M
