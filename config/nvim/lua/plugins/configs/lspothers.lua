local M = {}

M.trouble = function()
  local present, trouble = pcall(require, "trouble")

  if not present then
    return
  end

  trouble.setup()
end

M.lsp_lines = function()
  local present, lsp_lines = pcall(require, "lsp_lines")

  if not present then
    return
  end

  lsp_lines.setup()
end

M.rust_tools = function()
  local present, rust_tools = pcall(require, "rust-tools")

  if not present then
    return
  end

  rust_tools.setup()
end

-- M.mason_lspconfig = function()
--   local present, mason_lspconfig = pcall(require, "mason-lspconfig")
--
--   if not present then
--     return
--   end
--
--   mason_lspconfig.setup()
-- end

return M
