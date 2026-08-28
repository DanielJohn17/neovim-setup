-- Trigger checktime whenever coming back to Neovim
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  callback = function()
    vim.cmd("checktime")
  end,
})

-- Notify when file changed externally
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  callback = function()
    vim.notify("File updated from disk", vim.log.levels.INFO)
  end,
})
