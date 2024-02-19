" Movement keys to spanish layout
noremap j h
noremap k j
noremap l k
noremap ñ l

" Vim windows navigation keys -- spanish layout --
tnoremap <C-j> <C-\><C-N><C-w>h
tnoremap <C-k> <C-\><C-N><C-w>j
tnoremap <C-l> <C-\><C-N><C-w>k
tnoremap <C-ñ> <C-\><C-N><C-w>l
inoremap <C-j> <C-\><C-N><C-w>h
inoremap <C-k> <C-\><C-N><C-w>j
inoremap <C-l> <C-\><C-N><C-w>k
inoremap <C-ñ> <C-\><C-N><C-w>l
nnoremap <C-j> <C-w>h
nnoremap <C-k> <C-w>j
nnoremap <C-l> <C-w>k
nnoremap <C-ñ> <C-w>l

" Open terminal
noremap <C-T> :new +resize10 term://zsh<cr>
