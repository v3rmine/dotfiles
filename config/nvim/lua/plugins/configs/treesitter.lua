local M = {}

M.setup_treesitter = function()
  local present, treesitter = pcall(require, 'nvim-treesitter.configs')

  if not present then
    return
  end

  local options = {
    enabled = true,
    -- ensure_installed = {
    --   'lua',
    --   'javascript',
    --   'typescript',
    --   'tsx',
    --   'rust',
    --   'toml'
    -- },
    auto_install = false,
    highlight = {
      enable = true,
      use_languagetree = true,
      additional_vim_regex_highlighting = true,
    },
    ident = { enable = true },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },
    textobjects = {
      enable = true,
      lookahead = true,
    }
  }

  vim.wo.foldmethod = 'expr'
  vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

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

  treesitter_context.setup(options)
end

return M;
