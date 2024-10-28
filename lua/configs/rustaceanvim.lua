local adapter

local success, package = pcall(function()
  return require("mason-registry").get_package "codelldb"
end)

local cfg = require "rustaceanvim.config"

if success then
  local package_path = package:get_install_path()
  local codelldb_path = package_path .. "/codelldb"
  local liblldb_path = package_path .. "/extension/lldb/lib/liblldb"
  local this_os = vim.loop.os_uname().sysname

  liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
  adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path)
else
  adapter = cfg.get_codelldb_adapter()
end

local server = {
  settings = function(project_root, default_settings)
    local merge_table = default_settings
    local ra = require "rustaceanvim.config.server"
    return ra.load_rust_analyzer_settings(project_root, {
      settings_file_pattern = "rust-analyzer.json",
      default_settings = merge_table,
    })
  end,
}

local opts = { server = server, dap = { adapter = adapter }, tools = { enable_clippy = false } }

vim.g.rustaceanvim = vim.tbl_extend("force", opts, vim.g.rustaceanvim or {})
