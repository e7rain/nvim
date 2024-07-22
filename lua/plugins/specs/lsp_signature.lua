return {
  enabled = true,
  "ray-x/lsp_signature.nvim",
  event = "LspAttach",
  config = function(_, opts)
    require("lsp_signature").setup(opts)
  end,
}
