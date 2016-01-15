" ::::::::: Keybindings :::::::::::::::::::


let mapleader = ','


" Timeout mappings fast and key codes faster
set timeout timeoutlen=300 ttimeoutlen=100


" Ctrl+S for saving, also in Insert mode
nnoremap <C-k>s :update<CR>
vnoremap <C-k>s <C-C>:update<CR>
inoremap <C-k>s <C-O>:update<CR>

" Ctrl+C Copy
nnoremap <C-k>c "+y<Space>
vnoremap <C-k>c "+y
inoremap <C-k>c <C-o>"+y

" Ctrl+V Paste
" map <C-k>v  "+gP
nnoremap <C-k>v "+gP
vnoremap <C-k>v "+gP
inoremap <C-k>v <C-o>"+gP
cnoremap <C-k>v <C-r>+

" Ctrl+X Cut
nnoremap <C-k>x "+dd
vnoremap <C-k>x "+x
inoremap <C-k>x <C-o>"+x

" Redo
" CTRL-Z is Undo; not in cmdline though
nnoremap <C-k>z u
inoremap <C-k>z <C-O>u
" CTRL-Y is Redo (although not repeat); not in cmdline though
nnoremap <C-k>y <C-R>
inoremap <C-k>y <C-O><C-R>

" CTRL-A is Select all
nnoremap <C-k>a gggH<C-O>G
inoremap <C-k>a <C-O>gg<C-O>gH<C-O>G
cnoremap <C-k>a <C-C>gggH<C-O>G
onoremap <C-k>a <C-C>gggH<C-O>G
snoremap <C-k>a <C-C>gggH<C-O>G
xnoremap <C-k>a <C-C>ggVG


