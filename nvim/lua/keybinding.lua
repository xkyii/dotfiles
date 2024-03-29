
local Util = require('util')
local nmap = Util.nmap
local imap = Util.imap
local vmap = Util.vmap

-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- ctrl u / ctrl + d  只移动9行，默认移动半屏
nmap("<C-u>", "9k")
nmap("<C-d>", "9j")

-- visual模式下缩进代码
vmap('<', '<gv')
vmap('>', '>gv')

------------------------------------------------------------------
-- -- windows 分屏快捷键
-- map("n", "sv", ":vsp<CR>", opt)
-- map("n", "sh", ":sp<CR>", opt)

-- -- 关闭当前
-- map("n", "sc", "<C-w>c", opt)
-- -- 关闭其他
-- map("n", "so", "<C-w>o", opt) -- close others

-- 比例控制
-- map("n", "s>", ":vertical resize +20<CR>", opt)
-- map("n", "s<", ":vertical resize -20<CR>", opt)
-- map("n", "s=", "<C-w>=", opt)
-- map("n", "sj", ":resize +10<CR>",opt)
-- map("n", "sk", ":resize -10<CR>",opt)

-- alt + hjkl  窗口之间跳转
nmap("<A-h>", "<C-w>h")
nmap("<A-j>", "<C-w>j")
nmap("<A-k>", "<C-w>k")
nmap("<A-l>", "<C-w>l")
