-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- keymaps to exec :MindOpenMain
local keymap = vim.keymap.set
keymap("n", "<leader>mg", ":MindOpenMain<CR>", { desc = "Open Mind" })
keymap("n", "<leader>mp", ":MindOpenProject<CR>", { desc = "Open Mind Project" })
