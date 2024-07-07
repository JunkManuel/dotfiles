local o = vim.opt
local g = vim.g

-- Autocmds
vim.cmd [[
augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

autocmd FileType nix setlocal shiftwidth=4
]]

-- Keybinds
local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

map('', 'j', 'h', opts)
map('', 'k', 'gj', opts)
map('', 'l', 'gk', opts)
map('', "ñ", 'l', opts)

map("", "<C-j>", "<C-w>h", opts)
map("", "<C-k>", "<C-w>j", opts)
map("", "<C-l>", "<C-w>k", opts)
map("", "<C-ñ>", "<C-w>l", opts)
map("t", "<C-j>", "<C-w>h", opts)
map("t", "<C-k>", "<C-w>j", opts)
map("t", "<C-l>", "<C-w>k", opts)
map("t", "<C-ñ>", "<C-w>l", opts)

map('n', '<C-n>', ':Telescope live_grep <CR>', opts)
map('n', '<C-f>', ':Telescope find_files <CR>', opts)
map('n', ';', ':', { noremap = true } )

g.mapleader = ' '

-- Performance
vim.loader.enable()
o.lazyredraw = true
o.shell = "zsh"
o.shadafile = "NONE"

-- Colors
o.termguicolors = true

-- Undo files
o.undofile = true

-- Indentation
o.smartindent = true
o.tabstop = 4
o.shiftwidth = 4
o.shiftround = true
o.expandtab = true
o.scrolloff = 3

-- Set clipboard to use system clipboard
o.clipboard = "unnamedplus"

-- Use mouse
o.mouse = "a"

-- Nicer UI settings
o.cursorline = true
o.relativenumber = true
o.number = true
o.signcolumn = "yes"

-- Get rid of annoying viminfo file
o.viminfo = ""
o.viminfofile = "NONE"

-- Miscellaneous quality of life
o.ignorecase = true
o.ttimeoutlen = 5
o.hidden = true
o.shortmess = "atI"
o.wrap = false
o.backup = false
o.writebackup = false
o.errorbells = false
o.swapfile = false
o.showmode = false
o.laststatus = 3
o.pumheight = 6
o.splitright = true
o.splitbelow = true
o.completeopt = "menuone,noselect"
