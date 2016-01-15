" ::::::::: Options :::::::::::::::::::::::


"   vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

" General {

    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set autochdir               " Automatically change $pwd of current buffer
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8
    if !has('nvim')
        set encoding=utf-8
    endif

    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    "set autowrite                       " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    " set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving
    " set iskeyword-=.                    " '.' is an end of word designator
    " set iskeyword-=#                    " '#' is an end of word designator
    " set iskeyword-=-                    " '-' is an end of word designator

    set noimdisable
    set iminsert=0
    set imsearch=0
" }

" Formatting {
    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
" }

" Vim UI {
    " color solarized                 " Load a colorscheme
    set background=dark         " Assume a dark background
    set laststatus=2
    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line
    set cursorcolumn                " Highlight current column
    set fillchars=vert:│
    highlight VertSplit cterm=NONE ctermfg=NONE ctermbg=NONE

    highlight CursorLine   cterm=NONE ctermbg=235 ctermfg=NONE
    highlight CursorColumn   cterm=NONE ctermbg=235 ctermfg=NONE
    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    "highlight clear CursorLineNr    " Remove highlight color from current line number
    highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000  "高亮提示框
    highlight Folded guibg=grey guifg=blue ctermfg=100 ctermbg=0
    highlight FoldColumn guibg=darkgrey guifg=white ctermfg=100 ctermbg=0


    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set wildignorecase
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1     " 光标在Normal时为框,Insert时为竖线
    "let $NVIM_TUI_ENABLE_TRUE_COLOR=1       " True gui colors in terminal

" }
" 
