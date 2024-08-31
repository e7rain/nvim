vim.api.nvim_create_autocmd("BufWinEnter", {
  desc = "Make q close help, man, quickfix, dap floats",
  callback = function(event)
    if vim.tbl_contains({ "help", "nofile", "quickfix", "rest-nvim.log" }, vim.bo[event.buf].buftype) then
      vim.keymap.set("n", "q", "<Cmd>close<CR>", {
        desc = "Close window",
        buffer = event.buf,
        silent = true,
        nowait = true,
      })
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "html" },
  callback = function(ev)
    vim.bo[ev.buf].formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "checkhealth",
    "fugitive*",
    "flow-*",
    "kulala*",
    "rest_nvim_result*",
    "*rest-nvim.log*",
    "dap.log",
    "git",
    "help",
    "lspinfo",
    "netrw",
    "notify",
    "qf",
    "query",
  },
  callback = function()
    vim.keymap.set("n", "q", vim.cmd.close, { desc = "close the current buffer", buffer = true })
  end,
})
