return {
  -- { import = "plugins.specs.lsp_signature" },
  { import = "plugins.specs.rust" },
  { import = "plugins.specs.dap" },
  { import = "plugins.specs.test" },
  { import = "plugins.specs.todo-comments" },
  { import = "plugins.specs.flash" },
  { import = "plugins.specs.git" },
  { import = "plugins.specs.schemastore" },
  { import = "plugins.specs.nvim-lint" },
  { import = "plugins.specs.trouble" },
  { import = "plugins.specs.smart-split" },
  { import = "plugins.specs.typescript-tools" },
  { import = "plugins.specs.kulala" },
  { import = "plugins.specs.markdown" },
  { import = "plugins.specs.hurl" },
  { import = "plugins.specs.python" },
  { import = "plugins.specs.diffview" },
  { import = "plugins.specs.oil" },
  { import = "plugins.specs.surround" },
  { import = "plugins.specs.zenmode" },
  {
    lazy = false,
    "echasnovski/mini.bufremove",
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = {
      ensure_installed = {
        -- "typescript-language-server",
        "yaml-language-server",
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        -- Javascript
        "prettierd",
        "eslint-lsp",
        "json-lsp",
        "js-debug-adapter",
        "chrome-debug-adapter",
        "vtsls",
        -- Docker
        "docker-compose-language-service",
        "dockerfile-language-server",
        "hadolint",
        -- Python
        "basedpyright",
        "isort",
        "black",
        -- Go
        "gopls",
        "gomodifytags",
        "iferr",
        "impl",
        "gotests",
        "goimports",
        "delve",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- "nvim-telescope/telescope-file-browser.nvim",
    },
    opts = function()
      local config = require "nvchad.configs.telescope"
      local actions = require "telescope.actions"

      config.defaults.mappings = vim.tbl_deep_extend("force", config.defaults.mappings, {
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        },
        i = {
          ["<c-j>"] = actions.move_selection_next,
          ["<c-k>"] = actions.move_selection_previous,
          ["<c-h>"] = "which_key",
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        },
      })

      config.extensions_list = vim.list_extend(config.extensions_list, { "fzf" })
      config.extensions["fzf"] = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      }

      return config
    end,
  },
}
