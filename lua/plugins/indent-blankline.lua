return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        injected_languages = true,
        highlight = { "IblScope" },
      },
    },
  },

  -- Disable LazyVim's default mini.indentscope to avoid conflict with ibl
  {
    "nvim-mini/mini.indentscope",
    enabled = false,
  },
}
