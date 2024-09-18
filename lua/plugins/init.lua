return {
  -- { import = "plugins.spec.ufo" },
  { import = "plugins.spec.rust" },
  { import = "plugins.spec.dap" },
  { import = "plugins.spec.test" },
  { import = "plugins.spec.todo-comments" },
  { import = "plugins.spec.flash" },
  { import = "plugins.spec.git" },
  { import = "plugins.spec.schemastore" },
  { import = "plugins.spec.nvim-lint" },
  { import = "plugins.spec.trouble" },
  { import = "plugins.spec.smart-split" },
  { import = "plugins.spec.typescript-tools" },
  { import = "plugins.spec.markdown" },
  { import = "plugins.spec.python" },
  { import = "plugins.spec.diffview" },
  { import = "plugins.spec.surround" },
  { import = "plugins.spec.zenmode" },
  { import = "plugins.spec.rest" },
  { import = "plugins.spec.mini" },
  { import = "plugins.spec.supermaven" },
  { import = "plugins.spec.projects" },
  {
    event = "VeryLazy",
    "j-hui/fidget.nvim",
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lsp = {
        signature = {
          enabled = false,
        },
      },
      cmdline = {
        view = "cmdline", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
      },
    },
  },
  {
    lazy = false,
    "Chaitanyabsprip/fastaction.nvim",
    ---@type FastActionConfig
    opts = {
      dismiss_keys = { "j", "k", "<c-c>", "q" },
      override_function = function(_) end,
      keys = "qwertyuiopasdfghlzxcvbnm",
      popup = {
        border = "rounded",
        hide_cursor = true,
        highlight = {
          divider = "FloatBorder",
          key = "MoreMsg",
          title = "Title",
          window = "NormalFloat",
        },
        title = "Code actions: ",
      },
      register_ui_select = false,
    },
    config = function(_, opts)
      vim.keymap.set("n", "<leader>a", '<cmd>lua require("fastaction").code_action()<CR>', {})
      vim.keymap.set("v", "<leader>a", "<esc><cmd>lua require('fastaction').range_code_action()<CR>", {})
      require("fastaction").setup(opts)
    end,
  },
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
  {
    "utilyre/barbecue.nvim",
    event = "LspAttach",
    dependencies = { "SmiteshP/nvim-navic" },
    opts = {},
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
      -- ensure_installed = {
      --   -- "typescript-language-server",
      --   "yaml-language-server",
      --   "lua-language-server",
      --   "stylua",
      --   "html-lsp",
      --   "css-lsp",
      --   -- Javascript
      --   "prettierd",
      --   "eslint-lsp",
      --   "json-lsp",
      --   "js-debug-adapter",
      --   "chrome-debug-adapter",
      --   "vtsls",
      --   -- Docker
      --   "docker-compose-language-service",
      --   "dockerfile-language-server",
      --   "hadolint",
      --   -- Python
      --   "basedpyright",
      --   "isort",
      --   "black",
      --   -- Go
      --   "gopls",
      --   "gomodifytags",
      --   "iferr",
      --   "impl",
      --   "gotests",
      --   "goimports",
      --   "delve",
      -- },
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
