local M = {}

local load_override = require("core.utils").load_override

M.autopairs = function()
  local present1, autopairs = pcall(require, "nvim-autopairs")
  local present2, cmp = pcall(require, "cmp")

  if not (present1 and present2) then
    return
  end

  local options = {
    fast_wrap = {},
    disable_filetype = { "TelescopePrompt", "vim" },
  }

  options = load_override(options, "windwp/nvim-autopairs")
  autopairs.setup(options)

  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

M.comment = function()
  local present, nvim_comment = pcall(require, "Comment")

  if not present then
    return
  end

  local options = {}
  options = load_override(options, "numToStr/Comment.nvim")
  nvim_comment.setup(options)
end

M.luasnip = function()
  local present, luasnip = pcall(require, "luasnip")

  if not present then
    return
  end

  local options = {
    history = true,
    updateevents = "TextChanged,TextChangedI",
  }

  options = load_override(options, "L3MON4D3/LuaSnip")
  luasnip.config.set_config(options)
  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.luasnippets_path or "" }

  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
      if
        require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require("luasnip").session.jump_active
      then
        require("luasnip").unlink_current()
      end
    end,
  })
end

M.gitsigns = function()
  local present, gitsigns = pcall(require, "gitsigns")

  if not present then
    return
  end

  local options = {
    signs = {
      -- add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
      -- change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
      -- delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
      -- topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
      -- changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
    },
  }

  options = load_override(options, "lewis6991/gitsigns.nvim")
  gitsigns.setup(options)
end

M.neogit = function()
  local present, neogit = pcall(require, "neogit")

  if present then
    neogit.setup()
  end
end

M.devicons = function()
  local present, devicons = pcall(require, "nvim-web-devicons")

  if present then
    local options = {}
    options = require("core.utils").load_override(options, "kyazdani42/nvim-web-devicons")

    devicons.setup(options)
  end
end

M.null_ls = function()
  local present, null_ls = pcall(require, "null-ls")

  if present then
    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.code_actions.shellcheck,
      }
    })
  end
end

M.guess_indent = function()
  local present, guess_indent = pcall(require, "guess-indent")

  if present then
    guess_indent.setup({
      auto_cmd = true,
    })
  end
end

return M
