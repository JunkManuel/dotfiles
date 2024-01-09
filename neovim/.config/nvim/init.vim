" Vim-Plug plugins
call plug#begin()

Plug 'junegunn/fzf' , { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'rebelot/kanagawa.nvim'

call plug#end()

" config sourcing
let $CONFIG_DIR = "~/.config/nvim"
source $CONFIG_DIR/keybindings.vim

set number
colorscheme kanagawa
