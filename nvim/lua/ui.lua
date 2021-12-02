-- 根据不同的UI加载不同的配置

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }


-- nvui
if vim.g.nvui then
  -- 配置全屏快捷键
  map('', '<A-CR>', '<Cmd>NvuiToggleFullscreen<CR>', opt)  
end


-- nvy
if vim.g.nvy then
end

