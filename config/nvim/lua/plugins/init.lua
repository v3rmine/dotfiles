-- vim.api.nvim_create_autocmd('BufWritePost', {
--     group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
--     pattern = 'plugins.lua',
--     command = 'source <afile> | PackerCompile',
-- })

local plugins = {
  -- -- --
  -- Package Manager
  -- -- --
  ['wbthomason/packer.nvim'] = {},
  -- -- --
  -- Required Plugins
  -- -- --
  ['nvim-lua/plenary.nvim'] = {},
  ['nathom/filetype.nvim'] = {},
  -- -- --
  -- Libraries
  -- -- --
  -- ['rktjmp/lush.nvim'] = {},
  ['RishabhRD/popfix'] = { module = 'popfix' },
  ['MunifTanjim/nui.nvim'] = { module = 'nui' },
  ['rcarriga/nvim-notify'] = { module = 'notify' },
  -- -- --
  -- Theme, Icons, StatusBar, BufferBar
  -- -- --
  ['kyazdani42/nvim-web-devicons'] = {
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
    after = 'tokyonight.nvim',
    event = 'BufEnter',
    config = function()
      require('plugins.configs.lualine')
    end,
  },
  ['j-hui/fidget.nvim'] = {
    after = 'lualine.nvim',
    config = function()
      require('fidget').setup()
    end,
  },
  -- ['goolord/alpha-nvim'] = {
  --   after = 'nvim-web-devicons',
  --   config = function()
  --     require('alpha').setup(require('alpha.themes.dashboard').config)
  --   end,
  -- },
  ['hood/popui.nvim'] = {
    requires = 'popfix',
    config = function()
      vim.g.popui_border_style = 'rounded'
      vim.ui.select = require('popui.ui-overrider')
      vim.ui.input = require('popui.input-overrider')
    end,
  },
  -- REVIEW: Break lualine
  -- ['folke/noice.nvim'] = {
  --   requires = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module='...'` entries
  --     'MunifTanjim/nui.nvim',
  --     'rcarriga/nvim-notify',
  --   },
  --   config = function()
  --     require('noice').setup()
  --   end,
  -- },
  ['numToStr/FTerm.nvim'] = { event = 'CursorHold' },
  -- -- --
  -- Treesitter
  -- -- --
  ['nvim-treesitter/nvim-treesitter'] = {
    event = 'CursorHold',
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
  ['nvim-treesitter/nvim-treesitter-textobjects'] = { after = 'nvim-treesitter' },
  ['nvim-treesitter/nvim-treesitter-refactor'] = { after = 'nvim-treesitter' },
  ['windwp/nvim-ts-autotag'] = { after = 'nvim-treesitter' },
  ['JoosepAlviste/nvim-ts-context-commentstring'] = { after = 'nvim-treesitter' },
  -- -- --
  -- Syntax Highlighting
  -- -- --
  ['norcalli/nvim-colorizer.lua'] = {
    event = 'CursorHold',
    config = function()
      require('colorizer').setup()
    end,
  },
  ['folke/todo-comments.nvim'] = {
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('plugins.configs.todo').setup()
    end,
  },
  -- -- --
  -- Git niceties
  -- -- --
  ['lewis6991/gitsigns.nvim'] = {
    ft = 'gitcommit',
    event = 'BufRead',
    config = function()
      require('plugins.configs.others').gitsigns()
    end,
  },
  -- ['TimUntersberger/neogit'] = {
  --   cmd = 'Neogit',
  --   config = function()
  --     require('plugins.configs.others').neogit()
  --   end,
  -- },
  -- -- --
  -- Completions
  -- -- --
  ['hrsh7th/nvim-cmp'] = {
    module = 'cmp',
    event = 'InsertEnter',
    config = function()
      require 'plugins.configs.cmp'
    end,
  },
  -- ['L3MON4D3/LuaSnip'] = {
  --   after = 'nvim-cmp',
  --   config = function()
  --     require('plugins.configs.others').luasnip()
  --   end,
  -- },
  -- ['saadparwaiz1/cmp_luasnip'] = {
  --   after = 'LuaSnip',
  -- },
  ['hrsh7th/cmp-nvim-lua'] = { after = 'nvim-cmp' },
  ['hrsh7th/cmp-nvim-lsp'] = { after = 'nvim-cmp' },
  ['hrsh7th/cmp-nvim-lsp-signature-help'] = { after = 'cmp-nvim-lsp' },
  ['hrsh7th/cmp-buffer'] = { after = 'cmp-nvim-lsp' },
  ['hrsh7th/cmp-path'] = { after = 'nvim-cmp' },
  -- ['github/copilot.vim'] = {
  --   after = 'nvim-cmp',
  -- },
  -- -- --
  -- LSP
  -- -- --
  ['neovim/nvim-lspconfig'] = {
    wants = 'cmp-nvim-lsp',
    -- ft = {
    --   'sh',
    --   'lua',
    --   'rust',
    --   'nim',
    --   'javascript',
    --   'javascriptreact',
    --   'javascript.jsx',
    --   'typescript',
    --   'typescriptreact',
    --   'typescript.tsx',
    --   'php',
    --   'c',
    --   'cpp',
    --   'nix',
    -- },
    event = 'BufRead',
    config = function()
      local lspconfig = require('plugins.configs.lspconfig')
      if
        vim.bo.filetype == 'javascript'
        or vim.bo.filetype == 'javascriptreact'
        or vim.bo.filetype == 'javascript.jsx'
      then
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
  ['jubnzv/virtual-types.nvim'] = {
    after = 'nvim-lspconfig',
  },
  ['jose-elias-alvarez/null-ls.nvim'] = {
    after = 'nvim-lspconfig',
    event = 'BufRead',
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
  -- -- --
  -- LSP for langs
  -- -- --
  ['simrat39/rust-tools.nvim'] = {
    after = 'nvim-lspconfig',
    ft = { 'rust' },
    config = function()
      require('plugins.configs.lspothers').rust_tools()
    end,
  },
  ['jose-elias-alvarez/typescript.nvim'] = {
    after = 'nvim-lspconfig',
    ft = { 'typescript', 'typescriptreact' },
    config = function()
      require('plugins.configs.lspothers').typescript_tools()
    end,
  },
  -- -- --
  -- Edit niceties
  -- -- --
  ['nmac427/guess-indent.nvim'] = {
    event = 'InsertEnter',
    config = function()
      require('plugins.configs.others').guess_indent()
    end,
  },
  ['phaazon/hop.nvim'] = {
    event = 'BufRead',
    branch = 'v2',
    config = function()
      require('hop').setup()
    end,
  },
  ['windwp/nvim-autopairs'] = {
    -- NOTE: nvim-autopairs needs to be loaded after nvim-cmp, so that <CR> would work properly
    after = 'nvim-cmp',
    event = 'InsertCharPre',
    config = function()
      require('plugins.configs.others').autopairs()
    end,
  }, -- REVIEW: Add 'kylechui/nvim-surround' ?
  ['numToStr/Comment.nvim'] = {
    event = 'BufRead',
    module = 'comment',
    keys = { 'gc', 'gb' },
    config = function()
      require('plugins.configs.others').comment()
    end,
  },
  ['wellle/targets.vim'] = { event = 'BufRead' },
  ['AndrewRadev/splitjoin.vim'] = {
    -- NOTE: splitjoin won't work with `BufRead` event
    -- Source: https://github.com/numToStr/dotfiles/blob/master/neovim/.config/nvim/lua/numToStr/plugins.lua
    event = 'CursorHold',
  },
  ['smjonas/live-command.nvim'] = {
    event = 'CmdwinEnter',
    config = function()
      require('live-command').setup {
        commands = {
          Norm = { cmd = 'norm' },
        },
      }
    end,
  },
  -- -- --
  -- Navigation and Fuzzy things
  -- -- --
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
  ['nvim-telescope/telescope-fzf-native.nvim'] = {
    after = 'telescope.nvim',
    run = 'make',
    config = function()
      ---@diagnostic disable-next-line: different-requires
      require('telescope').load_extension('fzf')
    end,
  },
  ['nvim-telescope/telescope-symbols.nvim'] = { after = 'telescope.nvim' },
  -- -- --
  -- Languages syntaxes
  -- -- --
  ['alaviss/nim.nvim'] = {
    ft = { 'nim' },
  },
  ['LnL7/vim-nix'] = {
    ft = { 'nix' }
  },
  -- -- --
  -- Whichkey
  -- -- --
  ['folke/which-key.nvim'] = {
    config = function()
      require 'plugins.configs.whichkey'
    end,
  },
}

require('core.packer').run(plugins)
