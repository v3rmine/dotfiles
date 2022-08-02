-- NOTE: Config mostly based on https://github.com/NvChad/NvChad

require("core")
require("core.options")

vim.defer_fn(function()
  require("core.utils").load_mappings()
end, 0)

require("core.packer").bootstrap()
require("plugins")