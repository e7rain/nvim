return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  opts = {
    manual_mode = true,
    patterns = {
      ".git",
      ".DS_Store",
      "node_modules",
      "package.json",
      "package-lock.json",
      "Makefile",
      "CMakeLists.txt",
      "Cargo.toml",
      "pyproject.toml",
      "requirements.txt",
      ".venv",
    },
  },
  config = function(_, opts)
    require("project_nvim").setup(opts)
    require("telescope").load_extension "projects"
  end,
}
