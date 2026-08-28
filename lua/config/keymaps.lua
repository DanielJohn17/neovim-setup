local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Command mode
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Search
map("n", "<leader>h", ":nohlsearch<CR>", opts)

map("i", "jj", "<Esc>", opts)

-- Delete without yanking
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Visual: move text up and down
map("v", "<A-DOWN>", ":m .+1<CR>==", opts)
map("v", "<A-UP>", ":m .-2<CR>==", opts)
map("v", "p", [["_dp]], { desc = "Paste without overwriting register" })

-- Visual Block: move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- System clipboard
map("v", "<C-c>", '"+y', opts)
map("n", "<C-v>", '"+p', opts)
map("v", "<C-v>", '"+p', opts)
map("v", "<C-x>", '"+d', opts)

-- Duplicate
map("n", "<M-d>", "yyp", { desc = "Duplicate line" })
map("v", "<M-d>", "ygv", { desc = "Duplicate selection" })

-- Select all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Buffer navigation
map("n", "<TAB>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-TAB>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>x", ":bdelete!<CR>", { desc = "Close buffer" })

-- Word deletion in insert mode (vscode like)
map("i", "<C-H>", "<C-w>", opts)
map("i", "<C-Del>", "<C-o>dw", opts)
map("i", "<C-Backspace>", "<C-o>db", opts)

-- Indent multiple lines
map("v", "<TAB>", ">gv", opts)
map("v", "<S-TAB>", "<gv", opts)

-- Comments (LazyVim bundles mini.comment)
map("n", "<leader>/", function()
  require("mini.comment").toggle_lines()
end, { desc = "Toggle comment" })
map("x", "<leader>/", function()
  require("mini.comment").toggle_lines(vim.fn.getpos("'<"), vim.fn.getpos("'>"))
end, { desc = "Toggle comment (visual)" })

-- Replace word under cursor (globally, interactive)
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<left><left><left>]], {
  noremap = true,
  desc = "Replace word under cursor",
})

-- LSP
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
