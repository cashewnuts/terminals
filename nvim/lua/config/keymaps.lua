-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
map("n", "bd", LazyVim.ui.bufremove, { desc = "Delete Buffer" })
map("n", "bp", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "bn", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<C-A-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<C-A-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
