local plugins = {
  -- Libs
  ['nvim-lua/plenary.nvim'] = { module = 'plenary' },
  ['wbthomason/packer.nvim'] = {},
  -- ['rktjmp/lush.nvim'] = {},
  ['RishabhRD/popfix'] = { module = 'popfix' },

  -- Ui
  ['kyazdani42/nvim-web-devicons'] = {
    module = 'nvim-web-devicons',
    config = function()
      require('plugins.configs.others').devicons()
    end,
  },
  ['folke/tokyonight.nvim'] = {
    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end,
  },
  ['nvim-lualine/lualine.nvim'] = {
    wants = 'folke/tokyonight.nvim',
    config = function()
      require 'plugins.configs.lualine'
    end,
  },

  ['goolord/alpha-nvim'] = {
    wants = 'nvim-web-devicons',
    config = function()
      require('alpha').setup(require('alpha.themes.dashboard').config)
    end,
  },

  ['hood/popui.nvim'] = {
    config = function()
      vim.g.popui_border_style = "rounded"
      vim.ui.select = require('popui.ui-overrider')
      vim.ui.input = require('popui.input-overrider')
    end,
  },

  -- Syntax
  ['nvim-treesitter/nvim-treesitter'] = {
    event = 'InsertEnter',
    run = ':TSUpdate',
    config = function()
      require('plugins.configs.treesitter').setup_treesitter()
    end,
  },
  ['nvim-treesitter/nvim-treesitter-context'] = {
    after = 'nvim-treesitter',
    config = function()
      require('plugins.configs.treesitter').setup_treesitter_context()
    end,
  },
  ['nvim-treesitter/nvim-treesitter-textobjects'] = {
    after = 'nvim-treesitter',
  },

  ['norcalli/nvim-colorizer.lua'] = {
    config = function()
      require('colorizer').setup()
    end,
  },

  ['folke/todo-comments.nvim'] = {
    wants = 'nvim-lua/plenary.nvim',
    config = function()
      require('plugins.configs.todo').setup()
    end,
  },

  -- Git
  ['lewis6991/gitsigns.nvim'] = {
    ft = 'gitcommit',
    config = function()
      require('plugins.configs.others').gitsigns()
    end,
  },

  ['TimUntersberger/neogit'] = {
    cmd = 'Neogit',
    config = function()
      require('plugins.configs.others').neogit()
    end,
  },

  -- Completion
  ['hrsh7th/nvim-cmp'] = {
    event = 'InsertEnter',
    config = function()
      require 'plugins.configs.cmp'
    end,
  },

  ['L3MON4D3/LuaSnip'] = {
    after = 'nvim-cmp',
    config = function()
      require('plugins.configs.others').luasnip()
    end,
  },

  ['saadparwaiz1/cmp_luasnip'] = {
    after = 'LuaSnip',
  },
  ['hrsh7th/cmp-nvim-lua'] = {
    after = 'cmp_luasnip',
  },
  ['hrsh7th/cmp-nvim-lsp'] = {
    after = 'cmp-nvim-lua',
  },
  ['hrsh7th/cmp-nvim-lsp-signature-help'] = {
    after = 'cmp-nvim-lsp',
  },
  ['hrsh7th/cmp-buffer'] = {
    after = 'cmp-nvim-lsp',
  },
  ['hrsh7th/cmp-path'] = {
    after = 'cmp-buffer',
  },

  -- Lsp
  ['neovim/nvim-lspconfig'] = {
    wants = 'nvim-cmp',
    ft = {
      'sh',
      'lua',
      'rust',
      'nim',
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
      'php',
      'c',
      'cpp',
      'nix',
    },
    config = function()
      local lspconfig = require('plugins.configs.lspconfig')
      if vim.bo.filetype == 'javascript' or vim.bo.filetype == 'javascriptreact' or vim.bo.filetype == 'javascript.jsx' then
        -- NOTE: If typescript we load tsserver using jose-elias-alvarez/typescript.nvim
        -- TODO: Need to refactor typescript / javascript lsp loading 
        lspconfig.setup_tsserver()
      end
    end,
  },
  ['williamboman/mason.nvim'] = {
    after = 'nvim-lspconfig',
    cmd = 'Mason',
    config = function()
      require 'plugins.configs.mason'
    end,
  },
  -- ["williamboman/mason-lspconfig.nvim"] = {
  --   after = { "mason.nvim", "nvim-lspconfig" },
  --   config = function()
  --     require("plugins.configs.lspothers").mason_lspconfig()
  --   end,
  -- },


  ['jubnzv/virtual-types.nvim'] = {
    after = 'nvim-lspconfig',
  },

  ['jose-elias-alvarez/null-ls.nvim'] = {
    after = 'nvim-lspconfig',
    config = function()
      require('plugins.configs.others').null_ls()
    end,
  },

  ['folke/trouble.nvim'] = {
    after = 'nvim-lspconfig',
    config = function()
      require('plugins.configs.lspothers').trouble()
    end,
  },

  ['https://git.sr.ht/~whynothugo/lsp_lines.nvim'] = {
    after = 'nvim-lspconfig',
    config = function()
      require('plugins.configs.lspothers').lsp_lines()
    end,
  },

  ['ray-x/lsp_signature.nvim'] = {
    after = 'nvim-lspconfig',
    config = function()
      require('plugins.configs.lspothers').lsp_signature()
    end,
  },

  -- REVIEW: is it really usefull?
  ['RishabhRD/nvim-lsputils'] = {
    after = 'nvim-lspconfig',
    wants = 'popfix',
    config = function()
      require('plugins.configs.lspothers').lsp_utils()
    end,
  },

  ['simrat39/rust-tools.nvim'] = {
    wants = 'nvim-lspconfig',
    ft = { 'rust' },
    config = function()
      require('plugins.configs.lspothers').rust_tools()
    end,
  },

  ['jose-elias-alvarez/typescript.nvim'] = {
    wants = 'nvim-lspconfig',
    ft = { 'typescript', 'typescriptreact' },
    config = function()
      require('plugins.configs.lspothers').typescript_tools()
    end,
  },

  -- Misc
  ['nmac427/guess-indent.nvim'] = {
    event = 'InsertEnter',
    config = function()
      require('plugins.configs.others').guess_indent()
    end,
  },

  ['phaazon/hop.nvim'] = {
    branch = 'v2',
    config = function()
      require('hop').setup()
    end,
  },

  ['windwp/nvim-autopairs'] = {
    after = 'nvim-cmp',
    config = function()
      require('plugins.configs.others').autopairs()
    end,
  }, -- REVIEW: Add "kylechui/nvim-surround" ?

  ['numToStr/Comment.nvim'] = {
    module = 'Comment',
    keys = { 'gc', 'gb' },
    config = function()
      require('plugins.configs.others').comment()
    end,
  },

  -- ["github/copilot.vim"] = {
  --   after = "nvim-cmp",
  -- },

  -- file managing , picker etc
  ['kyazdani42/nvim-tree.lua'] = {
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    config = function()
      require 'plugins.configs.nvimtree'
    end,
  },

  ['nvim-telescope/telescope.nvim'] = {
    cmd = 'Telescope',
    config = function()
      require 'plugins.configs.telescope'
    end,
  },

  -- Prog languages
  ['alaviss/nim.nvim'] = {
    ft = { 'nim' },
  },
  ['LnL7/vim-nix'] = {
    ft = { 'nix' }
  },

  -- Only load whichkey after all
  ['folke/which-key.nvim'] = {
    config = function()
      require 'plugins.configs.whichkey'
    end,
  },
}

require('core.packer').run(plugins)
