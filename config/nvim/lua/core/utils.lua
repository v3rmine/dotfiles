local M = {}
local api = vim.api

local merge_tb = vim.tbl_deep_extend

M.close_buffer = function(bufnr)
  if vim.bo.buftype == 'terminal' then
    vim.cmd(vim.bo.buflisted and 'set nobl | enew' or 'hide')
  elseif vim.bo.modified then
    print 'save the file bruh'
  else
    bufnr = bufnr or api.nvim_get_current_buf()
    vim.cmd('bd' .. bufnr)
  end
end

M.load_mappings = function(mappings, mapping_opt)
  -- set mapping function with/without whichkey
  local set_maps
  local whichkey_exists, wk = pcall(require, 'which-key')

  if whichkey_exists then
    set_maps = function(keybind, mapping_info, opts)
      wk.register({ [keybind] = mapping_info }, opts)
    end
  else
    set_maps = function(keybind, mapping_info, opts)
      if mapping_info[1] then
        local mode = opts.mode
        opts.mode = nil
        vim.keymap.set(mode, keybind, mapping_info[1], opts)
      end
    end
  end

  mappings = mappings or vim.deepcopy(require('core.mappings'))
  -- mappings.lspconfig = nil

  for _, section in pairs(mappings) do
    for mode, mode_values in pairs(section) do
      for keybind, mapping_info in pairs(mode_values) do
        -- merge default + user opts
        local default_opts = merge_tb('force', { mode = mode }, mapping_opt or {})
        local opts = merge_tb('force', default_opts, mapping_info.opts or {})

        if mapping_info.opts then
          mapping_info.opts = nil
        end

        set_maps(keybind, mapping_info, opts)
      end
    end
  end
end

-- merge default/user plugin tables
M.merge_plugins = function(default_plugins)
  local final_table = {}

  for key, _ in pairs(default_plugins) do
    default_plugins[key][1] = key
    final_table[#final_table + 1] = default_plugins[key]
  end

  return final_table
end

return M
