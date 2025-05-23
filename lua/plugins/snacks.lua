---@diagnostic disable: undefined-global
-- Snacks
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    styles = {
      notification = {
        border = "single",
      },
      notification_history = {
        border = "solid",
        width = 0.9,
        height = 0.8,
      },
      scratch = {
        border = "solid",
      },
    },
    bigfile = { enabled = true },
    lazygit = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    toggle = {
      enabled = true,
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    scope = { enabled = true },
    win = {
      enabled = true,
    },
  },
  ---@format disable-next
  keys = {
    {
      "<leader>z",
      function()
        Snacks.zen()
      end,
      desc = "Toggle Zen Mode",
    },
    {
      "<leader>Z",
      function()
        Snacks.zen.zoom()
      end,
      desc = "Toggle Zoom",
    },
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>S",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },
    {
      "<leader>n",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Notification History",
    },
    -- { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    {
      "<leader>un",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map "<leader>us"
        Snacks.toggle.option("wrap", { name = "Wrap" }):map "<leader>uw"
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map "<leader>uL"
        Snacks.toggle.diagnostics():map "<leader>ud"
        Snacks.toggle.line_number():map "<leader>ul"
        Snacks.toggle
          .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
          :map "<leader>uc"
        Snacks.toggle.treesitter():map "<leader>uT"
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map "<leader>ub"
        Snacks.toggle.inlay_hints():map "<leader>uh"
        Snacks.toggle.indent():map "<leader>ug"
        Snacks.toggle.dim():map "<leader>uD"
        Snacks.toggle({
          name = "Diffview",
          get = function()
            return require("diffview.lib").get_current_view() ~= nil
          end,
          set = function(state)
            vim.cmd("Diffview" .. (state and "Open" or "Close"))
          end,
        }):map "<leader>G"
      end,
    })
  end,
}
