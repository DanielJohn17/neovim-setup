return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "vim", "lua", "vimdoc", "html", "css" })
      else
        opts.ensure_installed = { "vim", "lua", "vimdoc", "html", "css" }
      end
    end,
  },
}
