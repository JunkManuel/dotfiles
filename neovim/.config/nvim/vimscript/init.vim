" Vim-Plug plugins
call plug#begin()

Plug 'junegunn/fzf' , { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'rebelot/kanagawa.nvim'

Plug 'dylanaraps/wal.vim'

Plug 'neovim/nvim-lspconfig'

call plug#end()

" Config sourcing
let $CONFIG_DIR = "~/.config/nvim/vimscript"
source $CONFIG_DIR/keybindings.vim

set number

set splitbelow

set clipboard+=unnamedplus
