local opts = {
  adapters = {
    require "neotest-jest" {
      -- jestCommand = "pnpm run test --",
      -- cwd = function(path) return vim.fn.getcwd() end,
    },
    -- require "neotest-python",
    require "rustaceanvim.neotest",
  },
  -- status = { virtual_text = true },
  -- output = { open_on_run = true },
  quickfix = {
    open = function()
      require("trouble").open { mode = "quickfix", focus = true }
    end,
  },
}

local rustaceanvim_avail, rustaceanvim = pcall(require, "rustaceanvim.neotest")
if rustaceanvim_avail then
  table.insert(opts.adapters, rustaceanvim)
end

return opts
