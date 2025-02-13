return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
        require('mason-lspconfig').setup({
            ensure_installed = {'lua_ls', 'rust_analyzer', 'pyright', 'wgsl_analyzer'}, -- Add your desired servers
        })
        local lspconfig = require('lspconfig')

        -- rust
        lspconfig.rust_analyzer.setup({})

        -- wgsl
        vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        pattern = "*.wgsl",
        callback = function()
            vim.bo.filetype = "wgsl"
        end,
        })
        lspconfig.wgsl_analyzer.setup({})
    end
}
