local M = {}

M.order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "lsp", "diagnostics", "macro", "cursor", "cwd" }
M.modules = {

  macro = function()
    if vim.fn.reg_recording() ~= "" then
      return "%#DiffDelete# " .. "◉ REC (" .. vim.fn.reg_recording() .. ") "
    else
      return ""
    end
  end,
  lsp = function()
    for _, client in ipairs(vim.lsp.get_clients()) do
      if client.attached_buffers[vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)] then
        return (vim.o.columns > 100 and "   [" .. client.name .. "]") or "   "
      end
    end

    return ""
  end,
  diagnostics = function()
    if not rawget(vim, "lsp") then
      return ""
    end

    local err = #vim.diagnostic.get(
      vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0),
      { severity = vim.diagnostic.severity.ERROR }
    )
    local warn = #vim.diagnostic.get(
      vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0),
      { severity = vim.diagnostic.severity.WARN }
    )
    local hints = #vim.diagnostic.get(
      vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0),
      { severity = vim.diagnostic.severity.HINT }
    )
    local info = #vim.diagnostic.get(
      vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0),
      { severity = vim.diagnostic.severity.INFO }
    )

    err = (err and err > 0) and ("%#DiagnosticError#" .. " " .. err .. " ") or ""
    warn = (warn and warn > 0) and ("%#DiagnosticWarn#" .. " " .. warn .. " ") or ""
    hints = (hints and hints > 0) and ("%#DiagnosticHint#" .. "󰌵 " .. hints .. " ") or ""
    info = (info and info > 0) and ("%#DiagnosticInfo#" .. "󰋼 " .. info .. " ") or ""

    return " " .. err .. warn .. hints .. info
  end,
}

return M
