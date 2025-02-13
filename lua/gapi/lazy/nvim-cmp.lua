return {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    config = function()
        local cmp = require('cmp')
        local lspconfig = require('lspconfig')

        cmp.setup({
            mapping = {
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            },
            sources = {
                { name = 'nvim_lsp' },
            },
        })

        -- Ensure LSP integration
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        lspconfig.lua_ls.setup({ capabilities = capabilities })
    end
}
