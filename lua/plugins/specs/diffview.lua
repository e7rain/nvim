return {
  {
    cmd = { "DiffviewOpen" },
    "sindrets/diffview.nvim",
    opts = {
      keymaps = {
        view = {

          ["q"] = "<Cmd>DiffviewClose<CR>",
        },
      },
    },
  },
}
