return {
  adapters = {
    require "neotest-jest" {
      -- jestCommand = "pnpm run test --",
      -- cwd = function(path) return vim.fn.getcwd() end,
    },
    -- require "neotest-python",
    require "rustaceanvim.neotest",
  },
}
