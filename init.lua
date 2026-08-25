vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- Ensures termguicolors is enabled if not already
vim.opt.termguicolors = true
vim.opt.autoread = true

-- Trigger checktime whenever coming back to Neovim
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  callback = function()
    vim.cmd "checktime"
  end,
})

-- Notify and refresh bufferline when file changed externally
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  callback = function()
    vim.notify(" File updated from disk", vim.log.levels.INFO)

    -- NVChad & bufferline refresh (safe)
    local ok, ui = pcall(require, "bufferline.ui")
    if ok and ui then
      ui.refresh()
    end
  end,
})

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("config.remote_clipboard").setup()
require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)
