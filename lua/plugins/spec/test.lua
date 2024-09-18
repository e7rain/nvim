return {
  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
      -- "nvim-neotest/neotest-python",
    },
    config = function(_, opts_)
      local opts = vim.tbl_extend("force", opts_, {
        adapters = {
          require "neotest-jest" {
            -- jestCommand = "pnpm run test --",
            -- cwd = function(path) return vim.fn.getcwd() end,
          },
          -- require "neotest-python",
          require "rustaceanvim.neotest",
        },
      })

      require("neotest").setup(opts)
    end,
  },
}
