local plugins = {
  ["nvim-lua/plenary.nvim"] = { module = "plenary" },
  ["wbthomason/packer.nvim"] = {},
  -- ["NvChad/extensions"] = { module = { "telescope", "nvchad" } },

  ["kyazdani42/nvim-web-devicons"] = {
    module = "nvim-web-devicons",
    config = function()
      require("plugins.configs.others").devicons()
    end,
  },
  ["folke/tokyonight.nvim"] = {
    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end,
  },
  ["nvim-lualine/lualine.nvim"] = {
    wants = "folke/tokyonight.nvim",
    config = function()
      require('lualine').setup({
        options = {
          theme = 'tokyonight'
        }
      })
    end,
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    module = "nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require "plugins.configs.treesitter"
    end,
  },

  -- git stuff
  ["lewis6991/gitsigns.nvim"] = {
    ft = "gitcommit",
    config = function()
      require("plugins.configs.others").gitsigns()
    end,
  },

  -- lsp stuff
  ["williamboman/mason.nvim"] = {
    config = function()
      require("plugins.configs.mason")
    end,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require("plugins.configs.lspconfig")
    end,
  },
  ["folke/trouble.nvim"] = {
    wants = "neovim/nvim-lspconfig",
    config = function()
      require('trouble').setup()
    end,
  },
  ["https://git.sr.ht/~whynothugo/lsp_lines.nvim"] = {
    config = function()
      require('lsp_lines').setup()
    end,
  },

  ["hrsh7th/nvim-cmp"] = {
    event = "InsertEnter",
    config = function()
      require "plugins.configs.cmp"
    end,
  },

  ["L3MON4D3/LuaSnip"] = {
    after = "nvim-cmp",
    config = function()
      require("plugins.configs.others").luasnip()
    end,
  },

  ["saadparwaiz1/cmp_luasnip"] = {
    after = "LuaSnip",
  },

  ["hrsh7th/cmp-nvim-lua"] = {
    after = "cmp_luasnip",
  },

  ["hrsh7th/cmp-nvim-lsp"] = {
    after = "cmp-nvim-lua",
  },

  ["hrsh7th/cmp-buffer"] = {
    after = "cmp-nvim-lsp",
  },

  ["hrsh7th/cmp-path"] = {
    after = "cmp-buffer",
  },

  -- misc plugins
  ["nmac427/guess-indent.nvim"] = {
    config = function()
      require('guess-indent').setup({
        auto_cmd = true,
      })
    end,
  },

  ["phaazon/hop.nvim"] = {
    branch = 'v2',
    config = function ()
      require('hop').setup()
    end,
  },

  ["windwp/nvim-autopairs"] = {
    after = "nvim-cmp",
    config = function()
      require("plugins.configs.others").autopairs()
    end,
  }, -- REVIEW: Add "kylechui/nvim-surround" ?

  ["numToStr/Comment.nvim"] = {
    module = "Comment",
    keys = { "gc", "gb" },
    config = function()
      require("plugins.configs.others").comment()
    end,
  },

  -- file managing , picker etc
  ["kyazdani42/nvim-tree.lua"] = {
    ft = "alpha",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require "plugins.configs.nvimtree"
    end,
  },

  ["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
    config = function()
      require "plugins.configs.telescope"
    end,
  },

  -- Only load whichkey after all the gui
  ["folke/which-key.nvim"] = {
    module = "which-key",
    config = function()
      require "plugins.configs.whichkey"
    end,
  },
}

require("core.packer").run(plugins)
