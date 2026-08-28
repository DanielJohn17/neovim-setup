return {
  "pmizio/typescript-tools.nvim",
  enabled = function()
    return not ((require("config.tsdetect").local_ts_major() or 0) >= 7)
  end,
  ft = {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    settings = {
      separate_diagnostic_server = true,
      publish_diagnostic_on = "insert_leave",

      tsserver_max_memory = "2048",

      tsserver_format_options = {
        allowIncompleteCompletions = false,
        allowRenameOfImportPath = true,
      },

      tsserver_file_preferences = {
        importModuleSpecifierPreference = "non-relative",
        importModuleSpecifierEnding = "minimal",
        includeCompletionsForModuleExports = true,
        includeCompletionsWithInsertText = true,
      },
    },
  },
}
