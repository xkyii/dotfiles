" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
" ::::::::: vimrc :::::::::::::::::::::::::

set nocompatible
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/Users/vkyii/.pyenv/versions/anaconda3-2.4.0/bin/python3.5'
let g:vk_plug_group=['general', 'programming']

" ::::::::: vim-plug ::::::::::::::::::::::

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" General {
if count(g:vk_plug_group, 'general')

    " Session控制
    Plug 'vim-scripts/sessionman.vim'

    " CtrlP 跳转
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tacahiroy/ctrlp-funky'

    " 大量Vim主题配色
    Plug 'flazz/vim-colorschemes'

    " 文件变化识别
    Plug 'mhinz/vim-signify'

    " 输入法自动切换
    Plug 'CodeFalling/fcitx-vim-osx'

    " Vim UI
    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'jlanzarotta/bufexplorer'
    Plug 'bling/vim-airline'
    if executable('ctags')
        Plug 'majutsushi/tagbar'
    endif

endif
" }

" Programming {

    " 自动补全
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --racer-completer' }
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    " 自动匹对[](){}等
    Plug 'jiangmiao/auto-pairs'

    " css配色
    Plug 'ap/vim-css-color', { 'for': ['css'] }

    " 语法检查
    Plug 'scrooloose/syntastic', { 'for': ['python', 'rust'] }

    " 注释
    Plug 'tpope/vim-commentary'

    " Gist,目前并不是很常用
    Plug 'mattn/webapi-vim', { 'on': 'Gist' }
    Plug 'mattn/gist-vim', { 'on': 'Gist' }

    " Rust,语法检查使用'scrooloose/syntastic',补全使用'Valloric/YouCompleteMe'(--racer-completer)
    Plug 'rust-lang/rust.vim', { 'for': 'rust' }

    " Python
    Plug 'klen/python-mode', { 'for': 'python' }

" }

" Misc {

" 还没有尝试的
" 多点选
" Plug 'terryma/vim-multiple-cursors'

" 可以预览命令效果
"Plug 'osyo-manga/vim-over'

" 选择代码块
"Plug 'gcmt/wildfire.vim'

" 彩虹括号...大概看lisp会好用吧
"Plug 'luochen1990/rainbow'

" }

call plug#end()


" ::::::::: Initialization ::::::::::::::::

syntax enable

runtime! init/**.vim
