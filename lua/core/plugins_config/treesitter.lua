require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "javascript", "go", "php", "html", "css", "csv", "sql", "bash", "json", "yaml", "toml", "regex", "rust", "java", "php", "dockerfile", "typescript" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
  },
}
