vim.cmd("source ~/.config/nvim/vimscript/init.vim")
require('settings')

require('plug/kanagawa')
require('plug/commenter')
require('plug/colorizer')
require('plug/cmp')
require('plug/lualine')

require('lsp/lsp')
require('lsp/ui')
require('lsp/keybindings')

require('telescope').setup()
require('ibl').setup()
