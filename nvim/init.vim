" 基础设置
lua require('basic')

" Packer插件管理
lua require('plugin')

" 快捷键映射
lua require('keybinding')

" UI配置
lua require('gui')

" 复制到windows剪贴板
" https://stackoverflow.com/questions/44480829/how-to-copy-to-clipboard-in-vim-of-bash-on-windows
autocmd TextYankPost * if v:event.operator ==# 'y' | call system('/mnt/c/Windows/System32/clip.exe', @0) | endif


" magic search
nnoremap / /\v
vnoremap / /\v

" set guifont=FiraCode NF:h14

