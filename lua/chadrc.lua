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
    format_colors = {
      tailwind = true,
    },
  },
}

M.lsp = {
  signature = true,
}

M.term = {
  -- winopts = { number = false },
  sizes = { sp = 0.3, vsp = 0.3, ["bo sp"] = 0.3, ["bo vsp"] = 0.3 },
  float = {
    row = 1,
    col = 1,
    width = 1,
    height = 0.6,
    border = "solid",
  },
}

-- M.nvdash = {
--   load_on_startup = true,
--   header = {
--     "                            ",
--     "            eovim          ",
--     "                            ",
--   },
--   buttons = {
--     { txt = "  Projects", keys = "Spc l p", cmd = "NeovimProjectDiscover" },
--     { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
--     { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
--   },
-- }

M.colorify = {
  enabled = true,
}

M.base46 = {
  theme = "everforest_light",
  theme_toggle = { "everforest_light", "everforest_light" },
  hl_add = {
    FlashLabel = {
      bg = "baby_pink",
      bold = true,
      italic = true,
      fg = "darker_black",
    },
    DiffviewFilePanelSelected = { bg = "yellow", fg = "darker_black" },
    ["@function.method.http"] = { bold = true },
  },
  hl_override = {
    DiffChangeDelete = { bg = "red", fg = "grey" },
    DiffText = { bg = "yellow", fg = "grey" },
    DiffAdd = { bg = "green", fg = "grey" },
    DiffDelete = { bg = "red", fg = "grey" },
    Boolean = { bold = true },
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    ["@variable.parameter"] = { italic = true },
    -- ["@variable.builtin"] = { italic = true },
    -- ["@keyword"] = { italic = true },
    -- ["@tag.attribute"] = { italic = true },
    -- ["@string"] = { italic = true },
  },
  integrations = {
    "cmp",
    "markview",
    "git",
    "lsp",
    "todo",
    "mason",
    "syntax",
    "treesitter",
    "dap",
    "trouble",
    "blankline",
    "devicons",
    "vim-illuminate",
    "diffview",
    "whichkey",
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
    "emmet-ls",
    "tailwindcss-language-server",

    -- Rust, C/C++
    "codelldb",

    -- Python
    "basedpyright",

    -- Go (Golang)
    "gopls",
    "goimports",
    "impl",
    "iferr",
    "delve",

    -- GraphQL
    "graphql-language-service-cli",
  },
}

return M
