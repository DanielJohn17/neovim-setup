require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>h", ":nohlsearch<CR>", opts)

map("i", "jj", "<Esc>", opts)

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- delete without yanking

-- Visual
-- Move text up and down
map("v", "<A-DOWN>", ":m .+1<CR>==", opts)
map("v", "<A-UP>", ":m .-2<CR>==", opts)
map("v", "p", '"_dp', opts)

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Copy, Cut, Paste and Undo keybinds --
map("v", "<C-c>", '"+y', opts)

map("n", "<C-v>", '"+p', opts)
map("v", "<C-v>", '"+p', opts)

map("v", "<C-x>", '"+d', opts)

map("n", "<M-d>", "yyp", opts) -- yank the current line
map("v", "<M-d>", "yyp", opts) -- yank the selected lines

map("n", "<C-a>", "gg<S-v>G", opts) -- select all

-- bufferline
map("n", "<TAB>", ":bnext<CR>", opts)
map("n", "<S-TAB>", ":bprevious<CR>", opts)

-- close bufferline
map("n", "<leader>x", ":bdelete!<CR>", opts)

-- vscode like keymaps
vim.keymap.set("i", "<C-H>", "<C-w>", opts)
vim.keymap.set("i", "<C-Del>", "<C-o>dw", opts)
vim.keymap.set("i", "<C-Backspace>", "<C-o>db", opts)

-- indent multiple lines
vim.keymap.set("v", "<TAB>", ">gv", opts)
vim.keymap.set("v", "<S-TAB>", "<gv", opts)

-- commnents
map("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", opts)
map("x", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", opts)

-- replace word under cursorline
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/><C-r><C-w>/gI<Left><Left><Left>]], opts)
