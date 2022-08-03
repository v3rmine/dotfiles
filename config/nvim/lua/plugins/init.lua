local plugins = {
  -- Libs
  ["nvim-lua/plenary.nvim"] = { module = "plenary" },
  ["wbthomason/packer.nvim"] = {},
  -- ["NvChad/extensions"] = { module = { "telescope" } },
  ["rktjmp/lush.nvim"] = {},

  -- Ui
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

  ["akinsho/bufferline.nvim"] = {
    wants = "kyazdani42/nvim-web-devicons",
    tag = "v2.*",
    event = "InsertEnter",
    config = function()
      require("bufferline").setup()
    end,
  },

  ["goolord/alpha-nvim"] = {
    wants = "kyazdani42/nvim-web-devicons",
    config = function ()
      require("alpha").setup(require("alpha.themes.dashboard").config)
    end,
  },

  -- Syntax
  ["nvim-treesitter/nvim-treesitter"] = {
    event = "InsertEnter",
    run = ":TSUpdate",
    config = function()
      require "plugins.configs.treesitter"
    end,
  },

  ["norcalli/nvim-colorizer.lua"] = {
    config = function()
      require("colorizer").setup()
    end,
  },

  ["folke/todo-comments.nvim"] = {
    wants = "nvim-lua/plenary.nvim",
    config = function()
      require("plugins.configs.todo").setup()
    end,
  },

  -- Git
  ["lewis6991/gitsigns.nvim"] = {
    ft = "gitcommit",
    config = function()
      require("plugins.configs.others").gitsigns()
    end,
  },

  ["TimUntersberger/neogit"] = {
    cmd = "Neogit",
    config = function()
      require("plugins.configs.others").neogit()
    end,
  },

  -- Lsp
  ["williamboman/mason.nvim"] = {
    cmd = "Mason",
    config = function()
      require("plugins.configs.mason")
    end,
  },


  ["neovim/nvim-lspconfig"] = {
    ft = require("plugins.configs.lspconfig").supported_filetypes,
    config = function()
      require("plugins.configs.lspconfig")
    end,
  },

  ["jubnzv/virtual-types.nvim"] = {
    after = "nvim-lspconfig",
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("plugins.configs.others").null_ls()
    end
  },

  ["folke/trouble.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("plugins.configs.lspothers").trouble()
    end,
  },

  ["https://git.sr.ht/~whynothugo/lsp_lines.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("plugins.configs.lspothers").lsp_lines()
    end,
  },

  ["simrat39/rust-tools.nvim"] = {
    after = "nvim-lspconfig",
    ft = { "rust" },
    config = function()
      require("plugins.configs.lspothers").rust_tools()
    end,
  },

  -- Completion
  ["hrsh7th/nvim-cmp"] = {
    event = "InsertEnter",
    config = function()
      require("plugins.configs.cmp")
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

  -- Misc
  ["nmac427/guess-indent.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("plugins.configs.others").guess_indent()
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

  ["github/copilot.vim"] = {
    after = "nvim-cmp",
  },

  -- file managing , picker etc
  ["kyazdani42/nvim-tree.lua"] = {
    ft = "alpha",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require("plugins.configs.nvimtree")
    end,
  },

  ["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
    config = function()
      require("plugins.configs.telescope")
    end,
  },

  -- Only load whichkey after all
  ["folke/which-key.nvim"] = {
    config = function()
      require("plugins.configs.whichkey")
    end,
  },
}

require("core.packer").run(plugins)
