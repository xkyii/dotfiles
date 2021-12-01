require('nvim-tree').setup({
  -- 关闭文件时自动关闭
  auto_close = true,
  
  -- 不显示 git 状态图标
  git = {
    enable = false
  }
})


local opt = {noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<A-m>', ':NvimTreeToggle<CR>', opt)
