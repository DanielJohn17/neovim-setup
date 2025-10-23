require("nvchad.configs.lspconfig").defaults()

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
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
