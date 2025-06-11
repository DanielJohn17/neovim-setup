local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<leader>h", ":nohlsearch<CR>", opts)

keymap("i", "jj", "<Esc>", opts)

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

keymap("n", "<C-v>", '"+p', opts)
keymap("v", "<C-v>", '"+p', opts)

keymap("v", "<C-x>", '"+d', opts)

keymap("n", "<M-d>", "yyp", opts) -- yank the current line
keymap("v", "<M-d>", "yyp", opts) -- yank the selected lines

keymap("n", "<C-a>", "gg<S-v>G", opts) -- select all

-- bufferline
keymap("n", "<TAB>", ":bnext<CR>", opts)
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)

-- close bufferline
keymap("n", "<leader>x", ":bdelete!<CR>", opts)

-- vscode like keymaps
vim.keymap.set("i", "<C-H>", "<C-w>", opts)
vim.keymap.set("i", "<C-Del>", "<C-o>dw", opts)
vim.keymap.set("i", "<C-Backspace>", "<C-o>db", opts)

-- indent multiple lines
vim.keymap.set("v", "<TAB>", ">gv", opts)
vim.keymap.set("v", "<S-TAB>", "<gv", opts)

-- commnents
keymap("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", opts)
keymap("x", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", opts)
