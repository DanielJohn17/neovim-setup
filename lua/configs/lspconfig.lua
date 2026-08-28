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

-- htmx LSP: attach to templ files
vim.lsp.config.htmx = {
  filetypes = { "html", "templ" },
}

-- TypeScript 7 native (Go) LSP: prefer the local project's tsc, fall back to global
vim.lsp.config("tsgo", {
  cmd = function(dispatchers, config)
    local cmd = "tsc"
    if (config or {}).root_dir then
      local local_cmd = vim.fs.joinpath(config.root_dir, "node_modules/.bin", "tsc")
      if vim.fn.executable(local_cmd) == 1 then
        cmd = local_cmd
      end
    end
    return vim.lsp.rpc.start({ cmd, "--lsp", "--stdio" }, dispatchers)
  end,
})

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
  "htmx",
}

if (require("configs.tsdetect").local_ts_major() or 0) >= 7 then
  table.insert(servers, "tsgo")
end

vim.lsp.enable(servers)
