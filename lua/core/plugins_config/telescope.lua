local status, builtin = pcall(require, "telescope.builtin")
if not status then
  print("Telescope is not installed properly!")
  return
end

vim.keymap.set("n", "<c-p>", builtin.find_files, {})
vim.keymap.set("n", "<Space><Space>", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<Space>fh", builtin.help_tags, {})

require("telescope").setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
  },
  pickers = {
    find_files = {
      hidden = true,
    }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
    },
  },
})

require("telescope").load_extension("ui-select")
