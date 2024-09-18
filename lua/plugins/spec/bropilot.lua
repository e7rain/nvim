return {
  "meeehdi-dev/bropilot.nvim",
  event = "VeryLazy", -- preload model on start
  dependencies = {
    "nvim-lua/plenary.nvim",
    "j-hui/fidget.nvim",
  },
  opts = {
    auto_suggest = false,
    model = "starcoder2:3b",
    -- model = "codegemma:2b-code",
    -- model_params = { -- codegemma
    --   num_predict = 128,
    --   temperature = 0.2,
    --   top_p = 0.9,
    --   stop = { "<|file_separator|>" },
    -- },
    prompt = { -- FIM
      prefix = "<|fim_prefix|>",
      suffix = "<|fim_suffix|>",
      middle = "<|fim_middle|>",
    },
    -- prompt = { -- FIM prompt for starcoder2
    --   prefix = "<fim_prefix>",
    --   suffix = "<fim_suffix>",
    --   middle = "<fim_middle>",
    -- },
    debounce = 500,
    keymap = {
      accept_line = "<M-Right>",
      suggest = "<C-Down>",
    },
  },
  config = function(_, opts)
    require("bropilot").setup(opts)
  end,
}
