require("nvchad.configs.lspconfig").defaults()

-- Tailwind: STRICT filetypes only
vim.lsp.config.tailwindcss = {
  filetypes = {
    "html",
    "css",
    "scss",
    "javascriptreact",
    "typescriptreact",
    "templ",
  },

  -- Prevent tailwind from attaching to plain TS/JS
  root_dir = function(...)
    return require("lspconfig.util").root_pattern("tailwind.config.js", "tailwind.config.ts", "postcss.config.js")(...)
  end,
}

-- ESLint: diagnostics & fixes only
vim.lsp.config.eslint = {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
}

local servers = {
  "html",
  "cssls",
  "djlsp",
  "pylsp",
  "gopls",
  "clangd",
  "dockerls",
  "docker_compose_language_service",
  "tailwindcss",
  "bashls",
  "templ",
  "eslint",
  "postgres_lsp",
  "lua_ls",
}

vim.lsp.enable(servers)
