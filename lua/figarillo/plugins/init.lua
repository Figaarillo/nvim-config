-- plugins
require("figarillo.plugins.alpha")
require("figarillo.plugins.autopairs")
require("figarillo.plugins.autosave")
require("figarillo.plugins.cmp")
require("figarillo.plugins.colorizer")
require("figarillo.plugins.comment")
require("figarillo.plugins.devicons")
require("figarillo.plugins.indentblankline")
require("figarillo.plugins.lualine")
require("figarillo.plugins.lsp")
require("figarillo.plugins.neovide")
require("figarillo.plugins.nvim-tree")
require("figarillo.plugins.rest")
require("figarillo.plugins.tabnine")
require("figarillo.plugins.toggle-term")
require("figarillo.plugins.treesitter")
require("figarillo.plugins.staline")
require("figarillo.plugins.gitsings")

-- Colorschemes
require("figarillo.plugins.bluloco")
require("figarillo.plugins.dracula")
require("figarillo.plugins.everblush")
require("figarillo.plugins.onedarkpro")
require("figarillo.plugins.onedark")

-- Load theme
vim.cmd([[
try
  colorscheme onedark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme everblush
  set background=dark
endtry
]])
