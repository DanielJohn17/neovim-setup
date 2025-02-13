vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.clipboard = 'unnamedplus'

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

keymap('n', '<leader>h', ':nohlsearch<CR>', opts)

-- Resize
keymap("n", "<C-k>", ":resize +2<CR>", opts)
keymap("n", "<C-j>", ":resize -2<CR>", opts)
keymap("n", "<C-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-l>", ":vertical resize +2<CR>", opts)

-- Visual
-- Move text up and down
keymap("v", "<A-DOWN>", ":m .+1<CR>==", opts)
keymap("v", "<A-UP>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dp', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Copy, Cut, Paste and Undo keybinds --
keymap("v", "<C-c>", '"+y', opts)

keymap('n', "<C-v>", '"+p', opts)
keymap('v', "<C-v>", '"+p', opts)

keymap('v', "<C-x>", '"+d', opts)

-- bufferline
keymap('n', '<TAB>', ':bnext<CR>', opts)
keymap('n', '<S-TAB>', ':bprevious<CR>', opts)

-- close bufferline
keymap('n', '<leader>x', ':Bdelete!<CR>', opts)

-- vscode like keymaps
vim.keymap.set("i", "<C-H>", "<C-w>", opts)
vim.keymap.set("i", "<C-Del>", "<C-o>dw", opts)
