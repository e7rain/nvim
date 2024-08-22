vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "http",
  },
  callback = function()
    local wk = require "which-key"
    local k = require "kulala"
    wk.add {
      { "<leader>rr", k.run, desc = "󱂛  Request run", mode = "n", buffer = true },
      { "<leader>rc", k.copy, desc = "󱂛  Copy request", mode = "n", buffer = true },
      { "[r", k.jump_prev, desc = "󱂛  jump prev", mode = "n", buffer = true },
      { "]r", k.jump_next, desc = "󱂛  jump next", mode = "n", buffer = true },
    }
  end,
})

return {
  {
    "mistweaverco/kulala.nvim",
    lazy = true,
    ft = "http",
    config = function()
      local kulala = require "kulala"
      kulala.setup {
        default_view = "headers_body",
        default_env = "dev",
        contenttypes = {
          ["application/json"] = {
            ft = "json",
            formatter = { "jq", "." },
            pathresolver = require("kulala.parser.jsonpath").parse,
          },
          ["application/xml"] = {
            ft = "xml",
            formatter = { "xmllint", "--format", "-" },
            pathresolver = { "xmllint", "--xpath", "{{path}}", "-" },
          },
          ["text/html"] = {
            ft = "html",
            formatter = { "xmllint", "--format", "--html", "-" },
            pathresolver = {},
          },
        },
        icons = {
          inlay = {
            loading = "⏳",
            done = "✅",
            error = "💣",
          },
          lualine = "🐼",
        },
        -- additional_curl_options = { "-A", "Mozilla/5.0" },
        winbar = false,
      }
    end,
  },
}
