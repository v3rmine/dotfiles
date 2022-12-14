-- Disable LSP logging
vim.lsp.set_log_level(vim.lsp.log_levels.OFF)
-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config {
  virtual_text = false,
  virtual_lines = {
    source = 'always',
  },
  float = {
    source = 'always',
  }
}

--Common perf related flags for all the LSP servers
local flags = {
  allow_incremental_sync = true,
  debounce_text_changes = 200,
}

local present, lspconfig = pcall(require, 'lspconfig')

if not present then
  return
end

local utils = require 'core.utils'

local M = {}

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

  utils.load_mappings({}, { buffer = bufnr })
end

M.on_attach_virtual_types = function(client, bufnr)
  local vtype_present, virtualtypes = pcall(require, 'virtualtypes')

  if not vtype_present then
    return
  end

  virtualtypes.on_attach(client, bufnr)
  M.on_attach(client, bufnr)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
-- Updating capabilities https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local cmp_present, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if cmp_present then
  M.capabilities = cmp_nvim_lsp.default_capabilities()
end

lspconfig.sumneko_lua.setup {
  flags = flags,
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  settings = {
    Lua = {
      completion = {
        enable = true,
        showWord = 'Disable',
      },
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        -- library = vim.api.nvim_get_runtime_file('', true),
        library = os.getenv('VIMRUNTIME'),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.rust_analyzer.setup {
  flags = flags,
  on_attach = M.on_attach_virtual_types,
  capabilities = M.capabilities,
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        allFeatures = true,
        command = 'clippy',
      },
      diagnostics = {
        experimental = {
          enable = true,
        },
      },
    },
  },
}

M.setup_tsserver = function()
  lspconfig.tsserver.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
  }
end

local standard_servers = {
  'nimls', -- Nim,
  'zls', -- Zig
  'phpactor', -- PHP
  'clangd', -- C / C++
  -- 'nil_ls', -- Nix unofficial
  'rnix', -- Nix official
  'html', -- HTML,
  'cssls', -- CSS,
  'jsonls', -- JSON,
  'yamlls', -- YAML
  'bashls', -- Bash
  'pylsp', -- Python
}

for _, server in ipairs(standard_servers) do
  lspconfig[server].setup({
    flags = flags,
    capabilities = M.capabilities,
    on_attach = M.on_attach,
  })
end

return M
