" ::::::::: Plugin's Configure :::::::::::::::::::


" UltiSnips {
if isdirectory(expand("~/.config/nvim/plugged/ultisnips"))
    let g:UltiSnipsUsePythonVersion = 2
    " remap Ultisnips for compatibility for YCM
    let g:UltiSnipsExpandTrigger = '<C-j>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<S-tab]>'
endif
" }


" YouCompleteMe {
if isdirectory(expand("~/.config/nvim/plugged/YouCompleteMe"))
    set completeopt=menu,preview,longest
    let g:ycm_path_to_python_interpreter = '/usr/bin/python'
    "let g:ycm_path_to_python_interpreter = '/Users/vkyii/.pyenv/versions/2.7.10/bin/python2.7'
    "let g:ycm_server_use_vim_stdout = 1
    "let g:ycm_server_log_level = 'debug'
    let g:ycm_filetype_blacklist = {'tagbar' : 1, 'nerdtree' : 1,}

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

    autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
    inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
endif
" }


" NERDTree {
if isdirectory(expand("~/.config/nvim/plugged/nerdtree"))
    nmap <leader>ee <plug>NERDTreeTabsToggle<CR>
    nmap <leader>ef :NERDTreeFind<CR>
    let g:NERDShutUp=1
    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$', '\.DS_Store']
    let NERDTreeChDirMode=2
    let NERDTreeQuitOnOpen=0
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let NERDTreeHijackNetrw=1
    let NERDTreeHighlightCursorline=1
    let g:nerdtree_tabs_open_on_gui_startup=0
endif
" }


" Tagbar {
    nnoremap <leader>et :TagbarToggle<CR>
" }


" Vim-AirLine {
if isdirectory(expand("~/.config/nvim/plugged/vim-airline"))
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    if !exists('g:airline_theme')
        let g:airline_theme = 'term'
    endif
    if !exists('g:airline_powerline_fonts')
        " Use the default set of separators with a few customizations
        "let g:airline_left_sep='›'  " Slightly fancier than '>'
        "let g:airline_right_sep='‹' " Slightly fancier than '<'
        " unicode symbols
        let g:airline_left_alt_sep = '»'
        let g:airline_left_sep = '▶'
        let g:airline_right_alt_sep = '«'
        let g:airline_right_sep = '◀'
        let g:airline_symbols.crypt = '🔒'
        "let g:airline_symbols.linenr = '␊'
        "let g:airline_symbols.linenr = '␤'
        let g:airline_symbols.linenr = '¶'
        let g:airline_symbols.branch = '⎇'
        "let g:airline_symbols.paste = 'ρ'
        "let g:airline_symbols.paste = 'Þ'
        let g:airline_symbols.paste = '∥'
        let g:airline_symbols.whitespace = 'Ξ'
    endif

    " 开启tabline
    let g:airline#extensions#tabline#enabled = 1
    " tabline中当前buffer两端的分隔字符
    let g:airline#extensions#tabline#left_sep = ' '
    " tabline中未激活buffer两端的分隔字符
    let g:airline#extensions#tabline#left_alt_sep = '|'
    " tabline中buffer显示编号
    let g:airline#extensions#tabline#buffer_nr_show = 1

    " Set configuration options for the statusline plugin vim-airline.
    " Use the powerline theme and optionally enable powerline symbols.
    " To use the symbols , , , , , , and .in the statusline
    " segments add the following to your .vimrc.before.local file:
    let g:airline_powerline_fonts=1
    " If the previous symbols do not render for you then install a
    " powerline enabled font.
endif
" }


" Syntastic {
if isdirectory(expand("~/.config/nvim/plugged/syntastic"))
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
endif
" }


" PyMode {
if isdirectory(expand("~/.config/nvim/plugged/python-mode"))
    let g:pymode_python = 'python3'
endif
" }


" Session List {
    set sessionoptions=blank,buffers,curdir,folds,tabpages
    if isdirectory(expand("~/.vim/bundle/sessionman.vim"))
        nmap <leader>sl :SessionList<CR>
        nmap <leader>ss :SessionSave<CR>
        nmap <leader>sc :SessionClose<CR>
    endif
" }


" Commentary {
    if isdirectory(expand("~/.vim/bundle/vim-commentary"))
        nnoremap <C-_> :Commentary <CR>
        vnoremap <C-_> :Commentary <CR>gv
        inoremap <C-_> <c-o>:Commentary <CR>
    endif
" }

" Rainbow {
    if isdirectory(expand("~/.vim/bundle/rainbow"))
        let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
    endif
" }
