return {
  "nvim-lua/plenary.nvim",

  {
    "nvchad/base46",
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end,
  },

  "nvzone/volt",
  "nvzone/menu",
  { "nvzone/minty", cmd = { "Huefy", "Shades" } },

  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      dofile(vim.g.base46_cache .. "devicons")
      return { override = require "nvchad.icons.devicons" }
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = {
      indent = { char = "│", highlight = "IblChar" },
      scope = { char = "│", highlight = "IblScopeChar" },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")

      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require("ibl").setup(opts)

      dofile(vim.g.base46_cache .. "blankline")
    end,
  },

  -- file managing , picker etc
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  --   opts = function()
  --     return require "nvchad.configs.nvimtree"
  --   end,
  -- },

  {
    "folke/which-key.nvim",
    event = "VimEnter", -- Sets the loading event to 'VimEnter'
    delay = 0,
    opts = function()
      dofile(vim.g.base46_cache .. "whichkey")
      return {}
    end,
  },

  -- formatting!
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = function()
      return require "configs.conform"
    end,
  },

  -- git stuff
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require "configs.gitsigns"
    end,
  },

  -- lsp stuff
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = function()
      return require "configs.mason"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    dependencies = {
      "b0o/SchemaStore.nvim", -- json schema store
      "yioneko/nvim-vtsls", -- javascript utils
    },
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- load luasnips + cmp related in insert mode only
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "configs.luasnip"
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "andersevenrud/cmp-tmux",
      },
      {
        "supermaven-inc/supermaven-nvim",
        event = "VeryLazy",
        config = function()
          local opts = require "configs.supermaven"
          require("supermaven-nvim").setup(opts)
        end,
      },
    },
    opts = function()
      return require "configs.cmp"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = "Telescope",
    opts = function()
      return require "configs.telescope"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
      local opts = require "configs.treesitter"
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "echasnovski/mini.files",
    event = "VeryLazy",
    config = function(_)
      local opts = require "configs.mini-files"
      require("mini.files").setup(opts)
    end,
  },

  {
    "mrjones2014/smart-splits.nvim",
    config = function()
      local opts = require "configs.smart-splits"
      require("smart-splits").setup(opts)
    end,
  },

  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gvdiffsplit", "Gedit" },
  },

  {
    "rest-nvim/rest.nvim",
    ft = "http",
    config = function()
      require "configs.rest"
      require("telescope").load_extension "rest"
    end,
  },

  {

    "mfussenegger/nvim-dap",
    dependencies = {
      {
        {
          "igorlfs/nvim-dap-view",
          opts = {
            winbar = {
              show = true,
              sections = { "watches", "exceptions", "breakpoints", "threads", "repl" },
              default_section = "breakpoints",
            },
            windows = {
              height = 12,
              terminal = {
                position = "left",
                hide = { "pwa-node" },
                start_hidden = false,
              },
            },
          },
        },
        -- {
        --   "rcarriga/nvim-dap-ui",
        --   dependencies = { "nvim-neotest/nvim-nio" },
        -- },
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },
    config = function()
      require "configs.dap"
    end,
  },

  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    opts = {},
  },

  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    cmd = { "TroubleToggle", "Trouble" },
    opts = function()
      return require "configs.trouble"
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = function()
      return require "configs.noice"
    end,
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufRead",
    opts = {
      sign_priority = 1,
    },
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-go",
      "Issafalcon/neotest-dotnet",
    },
    config = function()
      local opts = require "configs.neotest"
      require("neotest").setup(opts)
      require "neotest-dotnet"
    end,
  },

  {
    "Issafalcon/neotest-dotnet",
    lazy = false,
    dependencies = {
      "nvim-neotest/neotest",
    },
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      local opts = require "configs.surround"
      require("nvim-surround").setup(opts)
    end,
  },

  {
    "coffebar/neovim-project",
    config = function()
      local opts = require "configs.neovim-project"
      require("neovim-project").setup(opts)
    end,
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append "globals" -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
      { "Shatur/neovim-session-manager" },
    },
    lazy = false,
    priority = 100,
  },

  -- Javascript
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    event = "BufRead package.json",
  },

  {
    "OXY2DEV/markview.nvim",
    ft = { "markdown", "codecompanion" },
    cmd = { "Markview" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local opts = require "configs.markview"
      require("markview").setup(opts)
    end,
  },
}
