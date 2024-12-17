dofile(vim.g.base46_cache .. "telescope")

local actions = require "telescope.actions"

return {
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

      n = {
        ["<c-d>"] = require("telescope.actions").delete_buffer,
        ["q"] = require("telescope.actions").close,
      },
      i = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
        ["<c-h>"] = "which_key",
        ["<c-d>"] = require("telescope.actions").delete_buffer,
        ["<c-s>"] = require("telescope.actions").select_vertical,
      },
    },
  },

  extensions_list = { "fzf", "themes", "terms", "rest" },
  extensions = {
    ["fzf"] = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}
