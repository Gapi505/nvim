return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()
    -- disable default virtual_text
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = true,
    })
  end,
}
