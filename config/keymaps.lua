-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- changing esc
vim.keymap.set({ "i", "v" }, "jk", "<ESC>", { noremap = true, silent = true, desc = "<ESC>" })

-- faster going up and down
vim.keymap.set({ "n", "v" }, "K", "5k", { noremap = true, desc = "Up faster" })
vim.keymap.set({ "n", "v" }, "J", "5j", { noremap = true, desc = "Down faster" })

-- Remap K and J
vim.keymap.set({ "n", "v" }, "<leader>k", "K", { noremap = true, desc = "Manual page" })
vim.keymap.set({ "n", "v" }, "<leader>j", "J", { noremap = true, desc = "Join lines" })

-- Save file
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { noremap = true, desc = "Save window" })
