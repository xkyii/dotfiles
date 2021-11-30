" 基础设置
lua require('basic')

" 皮肤
set background=dark

" 配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
