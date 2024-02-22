require('plugins.packer')
require('plugins.gruvbox')
-- -- Available plugins. Commented by default to make nvim faster
--require('plugins.treesitter')
--require('plugins.gitsigns')
require('plugins.floaterm')

-- -- Basic vim options
require("basic")
-- statusline
local opt = vim.opt
opt.statusline = '%1*%<%.50F %y'                            -- show filename & filepath (max 50 char) & filetype
opt.statusline = opt.statusline + "%=%2*%m%r%h%w %*"        -- right align from here; show vim buf status
opt.statusline = opt.statusline + "%3*%{&ff}[%{&fenc}] %*"  -- show file encoding
opt.statusline = opt.statusline + "%4* row:%l/%L,col:%c %*" -- show cursorline row & col
opt.statusline = opt.statusline + "%5*%3p%%%*"              -- show cursorline percent

-- -- keymaps
local keymap = vim.keymap
-- change leader
vim.g.mapleader = " "
keymap.set("i", "jj", "<ESC>")
-- move multi lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- switch window
keymap.set("n", "<c-h>", "<c-w>h")
keymap.set("n", "<c-j>", "<c-w>j")
keymap.set("n", "<c-k>", "<c-w>k")
keymap.set("n", "<c-l>", "<c-w>l")
-- system clipboard
-- opt.clipboard:append("unnamedplus") -- allow nvim to access the system clipboard, but it will slow startuptime
