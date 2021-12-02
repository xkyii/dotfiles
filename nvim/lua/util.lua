-- 工具类

local M = {}

local _opt = { noremap = true, silent = true }

local function _map(mode, lhs, rhs, opts)
  local o = opts or _opt
  local m = mode or ''
  vim.api.nvim_set_keymap(m, lhs, rhs, o)
end

M.map = function(lhs, rhs, opts)
  _map('', lhs, rhs, opts)
end

M.nmap = function(lhs, rhs, opts)
  _map('n', lhs, rhs, opts)
end

M.imap = function(lhs, rhs, opts)
  _map('i', lhs, rhs, opts)
end

M.vmap = function(lhs, rhs, opts)
  _map('v', lhs, rhs, opts)
end

return M

