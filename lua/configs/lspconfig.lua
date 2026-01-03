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

vim.lsp.config.ts_ls = {
  settings = {
    typescript = {
      suggest = {
        autoImports = true,
      },
      preferences = {
        -- REQUIRED
        includePackageJsonAutoImports = "on",

        -- Prefer package imports over relative ones
        importModuleSpecifier = "non-relative",

        -- Try to preserve subpath imports
        importModuleSpecifierPreference = "non-relative",

        -- IMPORTANT for hono-style exports
        quotePreference = "double",
      },
    },
    javascript = {
      suggest = {
        autoImports = true,
      },
      preferences = {
        includePackageJsonAutoImports = "on",
        importModuleSpecifier = "non-relative",
        importModuleSpecifierPreference = "non-relative",
      },
    },
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
