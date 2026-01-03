require("nvchad.configs.lspconfig").defaults()

vim.lsp.config.tailwindcss = {
  filetypes = {
    "html",
    "css",
    "scss",
    "javascriptreact",
    "typescriptreact",
    "templ",
  },
}

local servers = {
  "html",
  "cssls",
  "ts_ls",
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

-- read :h vim.lsp.config for changing options of lsp servers
