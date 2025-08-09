-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- keymaps to exec :MindOpenMain
local keymap = vim.keymap.set
keymap("n", "<leader>mg", ":MindOpenMain<CR>", { desc = "Open Mind" })
keymap("n", "<leader>mp", ":MindOpenProject<CR>", { desc = "Open Mind Project" })
keymap("n", "<leader>cF", function()
  local ignore_filetypes = { "lua" }
  if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
    vim.notify("range formatting for " .. vim.bo.filetype .. " not working properly.")
    return
  end

  local hunks = require("gitsigns").get_hunks()
  if hunks == nil then
    return
  end

  local format = require("conform").format
  local format_opts = require("conform").list_all_formatters()
  print(1)

  local function format_range()
        print(vim.inspect(hunks))
    if next(hunks) == nil then
      vim.notify("done formatting git hunks", "info", { title = "formatting" })
      return
    end
    local hunk = nil
    while next(hunks) ~= nil and (hunk == nil or hunk.type == "delete") do
      hunk = table.remove(hunks)
    end

    if hunk ~= nil and hunk.type ~= "delete" then
      local start = hunk.added.start
      local last = start + hunk.added.count
      -- nvim_buf_get_lines uses zero-based indexing -> subtract from last
      local last_hunk_line = vim.api.nvim_buf_get_lines(0, last - 2, last - 1, true)[1]
      local range = { start = { start, 0 }, ["end"] = { last - 1, last_hunk_line:len() } }
      vim.notify("formatting range: " .. vim.inspect(range), "info", { title = "formatting" })
      format({ range = range, async = true, lsp_fallback = true }, function()
        vim.defer_fn(function()
          format_range()
        end, 1)
      end)
    end
  end

  format_range()
end, { desc = "Formatting git hunks" })
