-- lua/custom/plugins/format.lua

local M = {}

M.format_changed_lines = function()
  local gitsigns = require('gitsigns')
  local changed_lines = {}

  -- Get the hunks from gitsigns
  local hunks = gitsigns.get_hunks()

  if not hunks then return end

  for _, hunk in ipairs(hunks) do
    local start = hunk.added.start
    local count = hunk.added.count

    -- Collect all changed lines
    for i = start, start + count - 1 do
      table.insert(changed_lines, i)
    end
  end

  -- Format the collected lines
  for _, lnum in ipairs(changed_lines) do
    vim.cmd(lnum .. "normal! gq")
  end
end

return M
