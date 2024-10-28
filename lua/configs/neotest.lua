local opts = {
  adapters = {
    require "neotest-jest" {
      -- jestCommand = "pnpm run test --",
      -- cwd = function(path) return vim.fn.getcwd() end,
    },
    -- require "neotest-python",
    require "rustaceanvim.neotest",
  },
}

local rustaceanvim_avail, rustaceanvim = pcall(require, "rustaceanvim.neotest")
if rustaceanvim_avail then
  table.insert(opts.adapters, rustaceanvim)
end

return opts
