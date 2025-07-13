local options = {
  formatters_by_ft = {
    go = { "goimports", lsp_format = "last" },
    python = { "black", lsp_format = "last" },
    lua = { "stylua" },
    css = { "eslint", "prettierd", stop_after_first = true },
    json = { "jq" },
    html = { "eslint", "prettierd", stop_after_first = true },
    typescript = { "eslint", "prettierd", stop_after_first = true },
    javascript = { "eslint", "prettierd", stop_after_first = true },
    typescriptreact = { "eslint", "prettierd", stop_after_first = true },
    javascriptreact = { "eslint", "prettierd", stop_after_first = true },
    graphql = { "prettierd", stop_after_first = true },
    cs = { "csharpier" },
  },
  format_on_save = { timeout_ms = 500, lsp_fallback = true },
  formatters = {
    csharpier = {
      command = vim.fn.stdpath "data" .. "/mason/bin/csharpier",
      args = { "format", "--write-stdout" },
      stdin = true,
    },
  },
}

return options
