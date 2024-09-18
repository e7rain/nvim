dofile(vim.g.base46_cache .. "telescope")

local options = {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
      },
      width = 0.87,
      height = 0.80,
    },
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
      i = {
        ["<C-s>"] = require("telescope.actions").select_vertical,
      },
    },
  },

  extensions_list = { "themes", "terms", "rest", "projects" },
  extensions = {},
}

return options
