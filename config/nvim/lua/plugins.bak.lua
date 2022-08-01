local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- https://github.com/jubnzv/virtual-types.nvim
-- https://github.com/TimUntersberger/neogit
-- https://github.com/github/copilot.vim
-- https://github.com/folke/todo-comments.nvim
-- https://github.com/williamboman/mason.nvim
-- https://github.com/goolord/alpha-nvim
-- https://github.com/lewis6991/gitsigns.nvim
-- https://github.com/kyazdani42/nvim-web-devicons
-- https://github.com/akinsho/bufferline.nvim
-- https://github.com/ms-jpq/chadtree
-- https://github.com/rktjmp/lush.nvim

-- TODO: Replace nvim-cmp with ms-jpq/coq_nvim

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager

  use({
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end,
  })
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'tokyonight'
        }
      })
    end,
  })

  use({
    "folke/which-key.nvim",
    config = function()
      require('which-key').setup()
    end,
  })

  use({
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    requires = "nvim-lua/plenary.nvim"
  })

  use({
    "windwp/nvim-autopairs",
    config = function()
      require('nvim-autopairs').setup()
    end,
  })
  use({
    "kylechui/nvim-surround",
    config = function()
      require('nvim-surround').setup()
    end,
  })
  use({
    "nmac427/guess-indent.nvim",
    config = function()
      require('guess-indent').setup({
        auto_cmd = true,
      })
    end,
  })
  use({
    "phaazon/hop.nvim",
    branch = 'v2',
    config = function ()
      require('hop').setup()
    end,
  })

  use('neovim/nvim-lspconfig') -- Configurations for Nvim LSP
  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require('lsp_lines').setup()
    end,
  })
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require('trouble').setup()
    end,
  })

  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'nvim_lua' },
        }, {
          { name = 'buffer' }
        })
      })
    end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
