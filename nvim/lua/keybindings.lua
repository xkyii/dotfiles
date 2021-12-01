-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 本地变量
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- visual模式下缩进代码
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)

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
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
