vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "markdown",
  },
  callback = function()
    local wk = require "which-key"
    wk.add {
      { "<leader>mp", "<Cmd>Markview<CR>", desc = "Markdown toggle preview", mode = "n", buffer = true },
    }
  end,
})

return {
  {
    "OXY2DEV/markview.nvim",
    ft = "markdown",
    cmd = { "Markview" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
