local servers = {
  html = {},
  cssls = {},
  djlsp = {},
  pylsp = {},
  gopls = {},
  clangd = {},
  dockerls = {},
  docker_compose_language_service = {},
  tailwindcss = {},
  bashls = {},
  templ = {},
  eslint = {},
  postgres_lsp = {},
  lua_ls = {},
  htmx = {},
  tui = {
    cmd = { "tui", "lsp" },
    filetypes = { "gsx" },
    root_markers = { "go.mod", "gsx.toml", ".git" },
    single_file_support = true,
    on_attach = function(client)
      client.server_capabilities.semanticTokensProvider = nil
    end,
  },
}

-- Tailwind: keep the strict filetypes + root pattern from the original config
servers.tailwindcss = {
  filetypes = {
    "html",
    "css",
    "scss",
    "javascriptreact",
    "typescriptreact",
    "templ",
    "gsx",
  },
  root_dir = function(fname)
    return require("lspconfig.util").root_pattern(
      "tailwind.config.js",
      "tailwind.config.ts",
      "postcss.config.js"
    )(fname)
  end,
}

-- ESLint: diagnostics & fixes only
servers.eslint = {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
}

-- htmx LSP: attach to templ files
servers.htmx = {
  filetypes = { "html", "templ" },
}

-- Enable the TS7 native (Go) tsgserver when local TypeScript >= 7
if (require("config.tsdetect").local_ts_major() or 0) >= 7 then
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
  servers.tsgo = {}
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")

      if not configs.tui then
        configs.tui = {
          default_config = {
            cmd = { "tui", "lsp" },
            filetypes = { "gsx" },
            root_dir = lspconfig.util.root_pattern("go.mod", "gsx.toml", ".git"),
            single_file_support = true,
          },
        }
      end

      opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, servers)
      opts.setup = opts.setup or {}
      opts.setup.tui = function(_, server_opts)
        lspconfig.tui.setup(server_opts)
        return true
      end
    end,
  },
}
