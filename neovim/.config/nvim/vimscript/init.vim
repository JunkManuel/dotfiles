" Vim-Plug plugins
call plug#begin()

" Plug 'junegunn/fzf' , { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

Plug 'rebelot/kanagawa.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lualine/lualine.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline' 

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'norcalli/nvim-colorizer.lua'


call plug#end()

" " Config sourcing
" let $CONFIG_DIR = "~/.config/nvim/vimscript"
" source $CONFIG_DIR/keybindings.vim
"
" " show numbers on screenborder
" set number
"
" " open new windows below current one per default
" set splitbelow
"
" " use xclip as neovim clipboard
" set clipboard+=unnamedplus
"
" " set tabsize to 4
" set tabstop=4
" set shiftwidth=4
" set expandtab
"
" " folding with sentidiño xd
" set foldmethod=marker
"
" " enable 24bit coloration on terminal
" set termguicolors
"
" set signcolumn=yes
