local function tui_bin()
  if vim.fn.executable("tui") == 1 then
    return "tui"
  end
  local gobin = vim.fn.trim(vim.fn.system("go env GOBIN"))
  local gopath = vim.fn.trim(vim.fn.system("go env GOPATH"))
  for _, p in ipairs({
    gobin .. "/tui",
    gopath .. "/bin/tui",
    gobin .. "/gsx",
    gopath .. "/bin/gsx",
  }) do
    if vim.fn.executable(p) == 1 then
      return p
    end
  end
  return "tui"
end

local function gsx_build(dir)
  vim.fn.mkdir(dir .. "/parser", "p")
  local out = vim.fn.system({ "tree-sitter", "build", "-o", dir .. "/parser/gsx.so", dir })
  if vim.v.shell_error ~= 0 then
    vim.notify("tree-sitter-gsx: parser build failed:\n" .. out, vim.log.levels.ERROR)
    return
  end
  vim.fn.mkdir(dir .. "/queries/gsx", "p")
  for _, q in ipairs({ "highlights", "injections" }) do
    local src = dir .. "/queries/" .. q .. ".scm"
    local dest = dir .. "/queries/gsx/" .. q .. ".scm"
    if vim.uv.fs_stat(src) then
      vim.uv.fs_copyfile(src, dest)
    end
  end
end

local function gsx_stale(dir)
  local so = vim.uv.fs_stat(dir .. "/parser/gsx.so")
  if not so then
    return true
  end
  local src = vim.uv.fs_stat(dir .. "/src/parser.c")
  return src ~= nil and src.mtime.sec > so.mtime.sec
end

vim.filetype.add({
  extension = {
    gsx = "gsx",
  },
})

return {
  {
    "gsxhq/tree-sitter-gsx",
    lazy = false,
    build = function(plugin)
      gsx_build(plugin.dir)
    end,
    init = function()
      vim.filetype.add({
        extension = {
          gsx = "gsx",
        },
      })
    end,
    config = function(plugin)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "gsx",
        callback = function(ev)
          if gsx_stale(plugin.dir) then
            gsx_build(plugin.dir)
          end
          pcall(vim.treesitter.start, ev.buf, "gsx")
          vim.bo[ev.buf].commentstring = "// %s"
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")

      if not configs.tui then
        configs.tui = {
          default_config = {
            cmd = { tui_bin(), "lsp" },
            filetypes = { "gsx" },
            root_dir = lspconfig.util.root_pattern("go.mod", "gsx.toml", ".git"),
            single_file_support = true,
          },
        }
      end

      opts.servers = opts.servers or {}
      opts.servers.tui = vim.tbl_deep_extend("force", {
        cmd = { tui_bin(), "lsp" },
        filetypes = { "gsx" },
        root_dir = lspconfig.util.root_pattern("go.mod", "gsx.toml", ".git"),
        root_markers = { "go.mod", "gsx.toml", ".git" },
        single_file_support = true,
        on_attach = function(client)
          -- tree-sitter handles gsx highlighting; disable semantic tokens to prevent decoration crashes on syntax errors
          client.server_capabilities.semanticTokensProvider = nil
        end,
      }, opts.servers.tui or {})

      opts.setup = opts.setup or {}
      opts.setup.tui = function(_, server_opts)
        lspconfig.tui.setup(server_opts)
        return true
      end
    end,
  },
}

