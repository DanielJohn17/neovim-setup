vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.colorscheme = "tokyonight"

vim.opt.termguicolors = true
vim.opt.autoread = true

-- LazyVim defaults are applied via the LazyVim plugin; only custom settings live here.

-- Remote clipboard provider (OSC 52 + Wayland) for tmux/SSH/herdr sessions
require("config.remote_clipboard").setup()
