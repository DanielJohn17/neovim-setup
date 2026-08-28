# LazyVim-based Neovim Configuration

A [LazyVim](https://github.com/LazyVim/LazyVim) based Neovim configuration,
migrated from NvChad, preserving the custom keybindings, LSP servers,
formatters, and development workflow.

## Structure

- `init.lua` — lazy.nvim bootstrap + loads `config.lazy`
- `lua/config/` — LazyVim core config:
  - `lazy.lua` — plugin spec (LazyVim imports + extras + local plugins)
  - `options.lua` — global options, leader, colorscheme, clipboard
  - `keymaps.lua` — all custom keybindings (ported from NvChad)
  - `autocmds.lua` — checktime + file-change notifications
  - `remote_clipboard.lua` — OSC 52 / Wayland clipboard provider
  - `tsdetect.lua` — local TypeScript version detection
- `lua/plugins/` — local plugin specs

## Language extras

Go, TypeScript, templ, Tailwind, Python, Docker, Clangd, JSON, Markdown,
YAML, SQL, Lua, Bash, HTMX via LazyVim extras.

## Custom plugins

- `github/copilot.vim`
- `stevearc/oil.nvim`
- `kdheepak/lazygit.nvim`
- `christoomey/vim-tmux-navigator`
- `brenoprata10/nvim-highlight-colors`
- `folke/lazydev.nvim`
- `lukas-reineke/indent-blankline.nvim`
- `gsxhq/tree-sitter-gsx` (`.gsx` files detected as `go`)

## Notes

- `.gsx` files have their own `gsx` filetype with native `tree-sitter-gsx`
  highlighting and `gsx lsp` integration, while `gopls` remains focused on Go files.
