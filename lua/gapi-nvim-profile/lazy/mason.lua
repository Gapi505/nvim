-- Package manager for LSP servers, linters and formatters
return {
    {
        'williamboman/mason.nvim',
        dependencies = {
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup {
        ensure_installed = {"tailwindcss", "zls", "lua_ls", "pyright"},
        automatic_enable = {
          exclude = { "rust_analyzer" }
        }
      } -- Automatically configures LSP servers

      vim.lsp.config.tailwindcss = { filetypes = {"rust", "html", "css"}}
    end,
  },
}
