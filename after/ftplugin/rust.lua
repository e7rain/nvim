local bufnr = vim.api.nvim_get_current_buf()
local map = vim.keymap.set

local function opts(desc)
  return { buffer = bufnr, desc = "LSP " .. desc }
end

map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
map("n", "<leader>lh", vim.lsp.buf.signature_help, opts "Show signature help")
map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")

map("n", "<leader>la", function()
  vim.cmd.RustLsp "codeAction"
end, { silent = true, buffer = bufnr })

map("n", "K", function()
  vim.cmd.RustLsp { "hover", "actions" }
end, { silent = true, buffer = bufnr })

-- map("n", "<c-k>", function()
--   vim.cmd.RustLsp { "moveItem", "up" }
-- end, { silent = true, buffer = bufnr })
--
-- map("n", "<c-j>", function()
--   vim.cmd.RustLsp { "moveItem", "down" }
-- end, { silent = true, buffer = bufnr })

map("n", "<leader>li", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })

map("n", "<leader>lr", function()
  require "nvchad.lsp.renamer"()
end, opts "Rename current symbol")
