local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager

  use 'folke/tokyonight.nvim'
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
    "windwp/nvim-autopairs",
    config = function()
      require('nvim-autopairs').setup()
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

  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require('lsp_lines').setup()
    end,
  })

  use({
    "ms-jpq/coq_nvim",
    branch = "coq",
    config = function()
      vim.g.coq_settings = { auto_start = true }
      require('coq')
    end,
  })
  use({
    "ms-jpq/coq.thirdparty",
    branch = "3p",
    config = function()
      require('coq_3p'){
        { src = "nvimlua", short_name = "nLUA" },
      }
    end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
