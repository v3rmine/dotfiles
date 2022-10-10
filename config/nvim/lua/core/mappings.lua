-- n, v, i, t = mode names

local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local M = {}

M.general = {
  i = {
    -- go to  beginning and end
    ['<C-b>'] = { '<Esc>^i', ' beginning of line' },
    ['<C-e>'] = { '<End>', ' end of line' },

    -- navigate within insert mode
    ['<C-h>'] = { '<Left>', ' move left' },
    ['<C-l>'] = { '<Right>', ' move right' },
    ['<C-j>'] = { '<Down>', ' move down' },
    ['<C-k>'] = { '<Up>', ' move up' },

    -- Move
    ['<C-Left>'] = { '<Esc>lbi', ' beginning of the word' },
    ['<C-Right>'] = { '<Esc>ea', ' end of the word' },

    -- Delete
    ['<C-BS>'] = { '<C-W>', ' delete previous word' },
    ['<C-Del>'] = { '<Esc>vedi', ' delete next word' },
  },

  n = {
    -- Move
    ['<C-Left>'] = { 'b', ' beginning of the word' },
    ['<C-Right>'] = { 'e', ' end of the word' },

    ['<Esc>'] = { '<cmd> noh <CR>', ' no highlight' },

    -- switch between windows
    ['<C-h>'] = { '<C-w>h', ' window left' },
    ['<C-l>'] = { '<C-w>l', ' window right' },
    ['<C-j>'] = { '<C-w>j', ' window down' },
    ['<C-k>'] = { '<C-w>k', ' window up' },

    -- save
    ['<C-s>'] = { '<cmd> w <CR>', '﬚ save file' },

    -- Copy all
    ['<C-c>'] = { '<cmd> %y+ <CR>', ' copy whole file' },

    -- line numbers
    ['<leader>n'] = { '<cmd> set nu! <CR>', ' toggle line number' },
    ['<leader>N'] = { '<cmd> set rnu! <CR>', ' toggle relative number' },

    -- Folds
    ['<leader><Tab>'] = '> < Control folds',
    ['<leader><Tab>q'] = { 'zA', '<=> toggle fold recursively' },
    ['<leader><Tab>o'] = { 'zR', '<<< open all the folds' },
    ['<leader><Tab>c'] = { 'zM', '>>> close all the folds' },

    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    -- empty mode is same as using <cmd> :map
    -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    ['j'] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
    ['k'] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    ['<Up>'] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    ['<Down>'] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
  },

  t = {
    ['<C-x>'] = { termcodes '<C-\\><C-N>', ' escape terminal mode' },
  },

  v = {
    ['j'] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
    ['k'] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    ['<Up>'] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    ['<Down>'] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },

    -- Move
    ['<C-Left>'] = { 'b', ' beginning of the word' },
    ['<C-Right>'] = { 'e', ' end of the word' },

    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ['p'] = { 'p:let @+=@0<CR>:let @"=@0<CR>', opts = { silent = true } },
  },
}

M.tabufline = {
  n = {
    ['<leader>b'] = '- buffer management',
    -- new buffer
    ['<leader>bo'] = { '<cmd> enew <CR>', '烙new buffer' },
    -- cycle through buffers
    ["<leader>bN"] = { "<cmd> bnext <CR>", " goto next buffer" },
    ["<leader>bn"] = { "<cmd> bprevious <CR> ", " goto prev buffer" },
    -- close buffer + hide terminal buffer
    ['<leader>bx'] = {
      function()
        require('core.utils').close_buffer()
      end,
      ' close buffer',
    },
  },
}

-- leader + /
M.comment = {
  -- toggle comment in both modes
  n = {
    ['<leader>/'] = { 'gcc', '蘒toggle comment' },
  },
  v = {
    ['<leader>/'] = { "<Esc>gbc<CR>", '蘒toggle comment' },
  },
}

-- leader + c
M.lspconfig = {
  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
  n = {
    ['K'] = {
      function()
        vim.lsp.buf.hover()
      end,
      ' lsp hover',
    },
    ['<leader>c'] = ' lsp actions',
    ['<leader>cD'] = {
      function()
        vim.lsp.buf.declaration()
      end,
      ' lsp declaration',
    },
    ['<leader>cd'] = {
      function()
        vim.lsp.buf.definition()
      end,
      ' lsp definition',
    },
    ['<leader>ci'] = {
      function()
        vim.lsp.buf.implementation()
      end,
      ' lsp implementation',
    },
    ['<leader>cs'] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      ' lsp signature_help',
    },
    ['<leader>ct'] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      ' lsp definition type',
    },
    ['<leader>cr'] = {
      function()
        vim.lsp.buf.rename()
      end,
      ' lsp rename',
    },
    ['<leader>ca'] = {
      function()
        vim.lsp.buf.code_action()
      end,
      ' lsp code_action',
    },
    ['<leader>cR'] = {
      function()
        vim.lsp.buf.references()
      end,
      ' lsp references',
    },
    ['<leader>cf'] = {
      function()
        vim.lsp.buf.formatting()
      end,
      ' lsp formatting',
    },

    ['<leader>ce'] = ' diagnostics',
    ['<leader>ceo'] = {
      function()
        vim.diagnostic.open_float()
      end,
      ' floating diagnostic',
    },
    ['<leader>cen'] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      ' goto prev',
    },
    ['<leader>ceN'] = {
      function()
        vim.diagnostic.goto_next()
      end,
      ' goto_next',
    },
    ['<leader>ces'] = {
      function()
        vim.diagnostic.setloclist()
      end,
      ' diagnostic setloclist',
    },

    ['<leader>cw'] = ' workspace management',
    ['<leader>cwa'] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      ' add workspace folder',
    },
    ['<leader>cwr'] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      ' remove workspace folder',
    },
    ['<leader>cwl'] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      ' list workspace folders',
    },
  },
}

-- leader + t
M.nvimtree = {
  n = {
    ['<leader>T'] = ' nvimtree',
    -- toggle
    ['<leader>Tt'] = { '<cmd> NvimTreeToggle <CR>', ' toggle nvimtree' },
    -- focus
    ['<leader>Tf'] = { '<cmd> NvimTreeFocus <CR>', ' focus nvimtree' },
  },
}

M.telescope = {
  n = {
    ['<leader>f'] = ' finding things',
    -- find => leader + f
    ['<leader>ff'] = { '<cmd> Telescope find_files <CR>', ' find files' },
    ['<leader>fa'] = { '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>', ' find all' },
    ['<leader>fc'] = { '<cmd> Telescope live_grep <CR>', ' live grep' },
    ['<leader>fb'] = { '<cmd> Telescope buffers <CR>', ' find buffers' },
    ['<leader>fh'] = { '<cmd> Telescope help_tags <CR>', ' help page' },
    ['<leader>fo'] = { '<cmd> Telescope oldfiles <CR>', ' find oldfiles' },
    ['<leader>fk'] = { '<cmd> Telescope keymaps <CR>', ' show keys' },
    ['<leader>fm'] = { '<cmd> Telescope man_pages <CR>', ' find man page' },

    -- git => leader + g
    ['<leader>g'] = ' Git',
    ['<leader>gc'] = { '<cmd> Telescope git_commits <CR>', ' git commits' },
    ['<leader>gt'] = { '<cmd> Telescope git_status <CR>', ' git status' },

    -- pick a hidden term 
    -- TODO: What is this
    -- ['<leader>ht'] = { '<cmd> Telescope terms <CR>', ' pick hidden term' },

    -- theme switcher
    -- TODO: How to configure this?
    -- ['<leader>th'] = { '<cmd> Telescope themes <CR>', ' themes' },
  },
}

-- leader + s
M.hop = {
  n = {
    ['<leader>s'] = '- jump anywhere',
    ['<leader>sw'] = { '<cmd> HopWord <CR>', '- go to word' },
    ['<leader>sc'] = { '<cmd> HopChar1 <CR>', '- go to char' },
    ['<leader>sp'] = { '<cmd> HopPattern <CR>', '- go to pattern' },
    ['<leader>sW'] = { '<cmd> Hop*MW <CR>', '- go to multi windows' },
    ['<leader>sl'] = { '<cmd> HopLineStart <CR>', '- go to line' },
  },
}

-- leader + hw
M.whichkey = {
  n = {
    ['<leader>hw'] = { ' WhichKey' },
    ['<leader>hwK'] = {
      function()
        vim.cmd 'WhichKey'
      end,
      ' which-key all keymaps',
    },
    ['<leader>hwk'] = {
      function()
        local input = vim.fn.input 'WhichKey: '
        vim.cmd('WhichKey ' .. input)
      end,
      ' which-key query lookup',
    },
  },
}

-- leader + h
M.helpers = {
  n = {
    ['<leader>h'] = '? helpers',
    ['<leader>hR'] = {
      function()
        for name,_ in pairs(package.loaded) do
          if name:match('^core') or name:match('^lsp') or name:match('^plugins') then
            package.loaded[name] = nil
          end
        end

        -- REVIEW: https://ustrajunior.com/posts/reloading-neovim-config-with-telescope/
        dofile(vim.env.MYVIMRC)
        vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
      end,
      '🗘  Reload config',
    },
  },
}



return M
