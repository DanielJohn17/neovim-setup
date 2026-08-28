return {
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- Language extras (templ/lua/bash/htmx are handled explicitly in lua/plugins/lsp.lua)
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.docker" },
    { import = "lazyvim.plugins.extras.lang.clangd" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.lang.sql" },

    -- Formatting / tooling
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.editor.refactoring" },

    -- Local custom plugins
    { import = "plugins" },
  },
  defaults = {
    lazy = true,
    version = false,
  },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}
