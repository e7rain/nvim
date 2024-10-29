-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  statusline = {
    theme = "vscode",
    order = require("configs.statusline").order,
    modules = require("configs.statusline").modules,
  },
  tabufline = {
    enabled = false,
  },
  telescope = {
    style = "borderless",
  },
  cmp = {
    style = "flat_dark",
  },
}

M.colorify = {
  enabled = true,
}

M.base46 = {
  theme = "decay",
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
    -- ["@string"] = { italic = true },
    ["@variable.builtin"] = { italic = true },
    ["@keyword"] = { italic = true },
  },
  integrations = {
    "cmp",
    "markview",
    "git",
    "lsp",
    "todo",
    "mason",
    "treesitter",
    "dap",
    "trouble",
  },
}

M.mason = {
  pkgs = {
    "lua-language-server",
    "stylua",

    -- General
    "prettierd",
    "yaml-language-server",
    "json-lsp",

    -- Javascript
    "eslint-lsp",
    "js-debug-adapter",
    "chrome-debug-adapter",
    "vtsls",

    -- Web
    "html-lsp",
    "css-lsp",

    -- Rust, C/C++
    "codelldb",
  },
}

return M
