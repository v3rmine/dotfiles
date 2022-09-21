local M = {}

M.setup_treesitter = function()
  local present, treesitter = pcall(require, 'nvim-treesitter.configs')

  if not present then
    return
  end

  local options = {
    ensure_installed = {
      'lua',
    },
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    textobjects = {
      enable = true,
      lookahead = true,
    }
  }

  -- check for any override
  options = require('core.utils').load_override(options, 'nvim-treesitter/nvim-treesitter')

  treesitter.setup(options)
end

M.setup_treesitter_context = function()
  local present, treesitter_context = pcall(require, 'treesitter-context')

  if not present then
    return
  end

  local options = {
    enable = true,
  }

  options = require('core.utils').load_override(options, 'nvim-treesitter/nvim-treesitter-context')

  treesitter_context.setup(options)
end

return M;
