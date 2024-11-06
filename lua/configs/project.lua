return {
  -- manual_mode = true,
  detection_methods = { "lsp", "pattern" },
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
}
