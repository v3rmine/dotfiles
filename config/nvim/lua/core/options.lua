local opt = vim.opt
local g = vim.g
local config = require('core.utils').load_config()

g.vim_version = vim.version().minor
g.toggle_theme_icon = '   '
g.transparency = config.ui.transparency
g.theme_switcher_loaded = false

-- use filetype.lua instead of filetype.vim. it's enabled by default in neovim 0.8 (nightly)
if g.vim_version < 8 then
  g.did_load_filetypes = 0
  g.do_filetype_lua = 1
end

opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.clipboard = 'unnamedplus'
opt.cul = true -- cursor line

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = ' ' }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = 'a'

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append 'sI'

opt.signcolumn = 'yes'
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append '<>[]hl'

-- By default, Ctrl-W only deletes previous words in the text 
-- entered after last starting insert mode, and stops deleting
-- text at the beginning of a line.
opt.backspace = "indent,eol,start"

g.mapleader = ' '

