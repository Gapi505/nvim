return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = { 'williamboman/mason.nvim' },
  config = function()
    require('mason-lspconfig').setup({
        ensure_installed = {'lua_ls', 'pyright', 'wgsl_analyzer', 'zls', 'cssls', 'jsonls', 'html', 'tailwindcss', 'sqls'}-- Add your desired servers
    })
    local lspconfig = require('lspconfig')

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    lspconfig.wgsl_analyzer.setup({ capabilities = capabilities })
    lspconfig.zls.setup({ capabilities = capabilities })
    lspconfig.pyright.setup({ capabilities = capabilities })
    lspconfig.cssls.setup({ capabilities = capabilities })
    lspconfig.html.setup({
      capabilities = capabilities,
      init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = { css = true, javascript = true },
        provideFormatter = true,
      },
    })
    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
      filetypes = { "html", "css", "scss", "javascript", "typescript"},
      init_options = {
        userLanguages = {
          htmx = "html",
        },
      },
    })
    lspconfig.jsonls.setup({})
  end
}
