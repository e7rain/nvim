-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  -- transparency = true,
  theme = "nightfox",
  theme_toggle = { "nightfox", "nightfox" },
  statusline = {
    theme = "vscode",
    separator_style = "block",
  },
  cmp = {
    style = "flat_dark",
  },
  hl_add = {
    FlashLabel = {
      bg = "baby_pink",
      bold = true,
      italic = true,
      fg = "darker_black",
    },
    DiffviewFilePanelSelected = { bg = "yellow", fg = "darker_black" },
  },
  hl_override = {
    DiffChangeDelete = { bg = "red", fg = "grey" },
    DiffText = { bg = "yellow", fg = "grey" },
    DiffAdd = { bg = "green", fg = "grey" },
    DiffDelete = { bg = "red", fg = "grey" },
    Boolean = { bold = true },
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.lsp = {
  signature = true,
}

M.base46 = {
  integrations = {
    "cmp",
    "git",
    "treesitter",
    "devicons",
    "nvimtree",
    "dap",
    "todo",
    "trouble",
  },
}

return M
