return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      ["docker-compose"] = { "hadolint" },
      ["rust"] = { "clippy" },
    },
  },
  config = function(_, opts)
    local utils = require "utils"
    local lint = require "lint"
    lint.linters_by_ft = opts.linters_by_ft

    -- lint.try_lint() -- start linter immediately
    local timer = vim.loop.new_timer()
    -- utils.autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" }, {
    utils.autocmd({ "BufEnter", "BufWritePost" }, {
      group = utils.augroup "Lint",
      callback = function()
        timer:start(100, 0, function()
          timer:stop()
          vim.schedule(lint.try_lint)
        end)
      end,
    })
  end,
}
-- EOP
