pcall(function()
  dofile(vim.g.base46_cache .. "syntax")
  dofile(vim.g.base46_cache .. "treesitter")
end)

return {
  ensure_installed = {
    "lua",
    "luadoc",
    "printf",
    "vim",
    "vimdoc",
    "typescript",
    "javascript",
    "graphql",
    "tsx",
    "json",
    "jsonc",
    "yaml",
    "xml",
    "dockerfile",
    "markdown",
    "markdown_inline",
    "html",
    "css",
    "hurl",
    "http",
    "tmux",
    "bash",
    "regex",
    "rust",
    "toml",
    "dockerfile",
    "python",
    -- Go
    "go",
    "gomod",
    "gosum",
    "gowork",
    -- csharp
    "c_sharp",
    "bicep",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<cr>",
      node_incremental = "<cr>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["ak"] = { query = "@block.outer", desc = "around block" },
        ["ik"] = { query = "@block.inner", desc = "inside block" },
        ["ac"] = { query = "@class.outer", desc = "around class" },
        ["ic"] = { query = "@class.inner", desc = "inside class" },
        ["a?"] = { query = "@conditional.outer", desc = "around conditional" },
        ["i?"] = { query = "@conditional.inner", desc = "inside conditional" },
        ["af"] = { query = "@function.outer", desc = "around function " },
        ["if"] = { query = "@function.inner", desc = "inside function " },
        ["ao"] = { query = "@loop.outer", desc = "around loop" },
        ["io"] = { query = "@loop.inner", desc = "inside loop" },
        ["aa"] = { query = "@parameter.outer", desc = "around argument" },
        ["ia"] = { query = "@parameter.inner", desc = "inside argument" },
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]k"] = { query = "@block.outer", desc = "Next block start" },
        ["]f"] = { query = "@function.outer", desc = "Next function start" },
        ["]a"] = { query = "@parameter.inner", desc = "Next argument start" },
      },
      goto_next_end = {
        ["]K"] = { query = "@block.outer", desc = "Next block end" },
        ["]F"] = { query = "@function.outer", desc = "Next function end" },
        ["]A"] = { query = "@parameter.inner", desc = "Next argument end" },
      },
      goto_previous_start = {
        ["[k"] = { query = "@block.outer", desc = "Previous block start" },
        ["[f"] = { query = "@function.outer", desc = "Previous function start" },
        ["[a"] = { query = "@parameter.inner", desc = "Previous argument start" },
      },
      goto_previous_end = {
        ["[K"] = { query = "@block.outer", desc = "Previous block end" },
        ["[F"] = { query = "@function.outer", desc = "Previous function end" },
        ["[A"] = { query = "@parameter.inner", desc = "Previous argument end" },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        [">K"] = { query = "@block.outer", desc = "Swap next block" },
        [">F"] = { query = "@function.outer", desc = "Swap next function" },
        [">A"] = { query = "@parameter.inner", desc = "Swap next argument" },
      },
      swap_previous = {
        ["<K"] = { query = "@block.outer", desc = "Swap previous block" },
        ["<F"] = { query = "@function.outer", desc = "Swap previous function" },
        ["<A"] = { query = "@parameter.inner", desc = "Swap previous argument" },
      },
    },
  },
}
