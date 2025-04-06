return {
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason-lspconfig.nvim' },
    config = function()
        local lspconfig = require('lspconfig')

        -- Example setup for Lua language server
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = { globals = { 'vim' } },
                    workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                },
            },
        })
    end
}
