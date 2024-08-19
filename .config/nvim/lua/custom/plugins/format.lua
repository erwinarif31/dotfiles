-- lua/user/format.lua
local M = {}

function M.format_changed_lines()
  local gitsigns = require 'gitsigns'
  local conform = require 'conform'

  local hunks = gitsigns.get_hunks()
  local format = conform.format

  for i = #hunks, 1, -1 do
    local hunk = hunks[i]
    if hunk ~= nil and hunk.type ~= 'delete' then
      local start = hunk.added.start
      local last = start + hunk.added.count
      local last_hunk_line = vim.api.nvim_buf_get_lines(0, last - 2, last - 1, true)[1]
      local range = { start = { start, 0 }, ['end'] = { last - 1, last_hunk_line:len() } }
      format { range = range }
    end
  end
end

return M
