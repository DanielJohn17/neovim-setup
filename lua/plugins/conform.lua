local function gsx_bin()
  if vim.fn.executable("tui") == 1 then
    return "tui"
  end
  local gobin = vim.fn.trim(vim.fn.system("go env GOBIN"))
  local gopath = vim.fn.trim(vim.fn.system("go env GOPATH"))
  for _, p in ipairs({ gobin .. "/tui", gopath .. "/bin/tui", gobin .. "/gsx", gopath .. "/bin/gsx" }) do
    if vim.fn.filereadable(p) == 1 then
      return p
    end
  end
  return "tui"
end

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },

        -- Web
        css = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },

        -- Go
        go = { "golines" },

        -- templ
        templ = { "prettier" },

        -- gsx
        gsx = { "gsx" },
      },
      formatters = {
        gsx = {
          command = gsx_bin,
          args = function(self, ctx)
            return { "fmt", ctx.filename }
          end,
          stdin = false,
        },
      },
    },
  },
}
