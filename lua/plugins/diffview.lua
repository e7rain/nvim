return {
  cmd = { "DiffviewOpen" },
  "sindrets/diffview.nvim",
  hooks = {
    diff_buf_read = function(bufnr)
      vim.b[bufnr].view_activated = false
    end,
  },
  config = function()
    local opts = require "configs.diffview"
    require("diffview").setup(opts)
  end,
}
