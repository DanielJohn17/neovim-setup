-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "bearded-arc",

  hl_override = {
  	Comment = { italic = true },
  	["@comment"] = { italic = true },
  },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  hl_override = {
    IblIndent = { fg = "#3b4261" }, -- Color for inactive lines (adjust to your theme)
    IblScope = { fg = "#7aa2f7" },  -- Color for the active scope (e.g., a bright blue)
  }
--       tabufline = {
--          lazyload = false
--      }
}

return M
