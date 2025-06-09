local opts = {
  floating = {
    border = "solid",
    max_height = 0.6,
    max_width = 0.6,
    options = {},
  },

  icons = {
    child_indent = "│",
    child_prefix = "├",
    collapsed = "─",
    expanded = "╮",
    failed = "",
    final_child_indent = " ",
    final_child_prefix = "╰",
    non_collapsible = "─",
    notify = "",
    passed = "",
    running = "󱫭",
    running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
    skipped = "󰔞",
    unknown = "",
    watching = "",
  },
  adapters = {
    require "neotest-go",
    require "neotest-jest" {
      -- jestCommand = "npm test --",
      -- jestConfigFile = "custom.jest.config.ts",
      -- env = { CI = true },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    },
    -- require "neotest-python",
  },
  -- status = { virtual_text = true },
  -- output = { open_on_run = true },
  quickfix = {
    open = function()
      require("trouble").open { mode = "quickfix", focus = true }
    end,
  },
}

return opts
