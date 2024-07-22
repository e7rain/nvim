return {
  "jellydn/hurl.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  ft = "hurl",
  opts = {
    -- Show notification on run
    show_notification = false,
    -- Show response in popup or split
    mode = "split",
    -- Default formatter
    formatters = {
      json = { "jq" }, -- Make sure you have install jq in your system, e.g: brew install jq
      html = {
        "prettier", -- Make sure you have install prettier in your system, e.g: npm install -g prettier
        "--parser",
        "html",
      },
    },
  },
  config = function(_, opts)
    local wk = require "which-key"
    wk.add {
      { "<leader>r", group = "󱂛  Http client" }, -- group
      { "<leader>rf", "<Cmd>HurlRunner<CR>", desc = "󱂛  Run file request", mode = "n" },
      { "<leader>rr", "<Cmd>HurlRunnerAt<CR>", desc = "󱂛  Run request", mode = "n" },
      { "<leader>re", "<Cmd>HurlRunnerToEntry<CR>", desc = "󱂛  Run request entry", mode = "n" },
    }
    require("hurl").setup(opts)
  end,
}
