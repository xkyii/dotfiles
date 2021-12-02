-- neovim-qt 配置

-- import
local Util = require('util')
local map = Util.map

-- local
local _isFullScreen = false

function _G.GuiToggleFullScreen()
  _isFullScreen = not _isFullScreen
  vim.fn.GuiWindowFullScreen(_isFullScreen)
end

local function _setup()
  if not vim.g.GuiLoaded then
    return
  end

  -- 设定快捷键
  -- Ctrl-Enter -> 切换全屏
  map('<A-CR>', '<Cmd>luado GuiToggleFullScreen()<CR>')

  -- 初始非全屏
  vim.fn.GuiWindowFullScreen(false)

  -- 其他初始化
  vim.cmd [[
    GuiTabline    0
    GuiPopupmenu  1
    GuiScrollBar  0
    GuiLinespace  0
  ]]
end

_setup()
