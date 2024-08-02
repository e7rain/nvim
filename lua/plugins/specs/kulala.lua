return {
  {
    "mistweaverco/kulala.nvim",
    lazy = true,
    ft = "http",
    config = function()
      local kulala = require "kulala"
      kulala.setup {
        -- default_view, body or headers
        default_view = "headers_body",
        -- dev, test, prod, can be anything
        -- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
        default_env = "dev",
        -- enable/disable debug mode
        debug = true,
        -- default formatters for different content types
        formatters = {
          json = { "jq", "." },
          xml = { "xmllint", "--format", "-" },
          html = { "xmllint", "--format", "--html", "-" },
        },
        -- default icons
        icons = {
          inlay = {
            loading = "⏳",
            done = "✅",
            error = "❌",
          },
          lualine = "🐼",
        },
        -- additional cURL options
        -- see: https://curl.se/docs/manpage.html
        additional_curl_options = {},
        winbar = false,
      }

      local wk = require "which-key"
      wk.add {
        { "<leader>r", group = "󱂛  Http client" }, -- group
        {
          "<leader>rr",
          function()
            kulala.run()
          end,
          desc = "󱂛  Request run",
          mode = "n",
        },
        {
          "<leader>rc",
          function()
            kulala.copy()
          end,
          desc = "󱂛  Request copy",
          mode = "n",
        },
        {
          "[r",
          function()
            kulala.jump_prev()
          end,
          desc = "󱂛  Jump prev request",
          mode = "n",
        },
        {
          "]r",
          function()
            kulala.jump_next()
          end,
          desc = "󱂛  Jump prev request",
          mode = "n",
        },
      }
    end,
  },
}
