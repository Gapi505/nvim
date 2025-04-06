return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
        require('mason-lspconfig').setup({
            ensure_installed = {'lua_ls', 'rust_analyzer', 'pyright', 'wgsl_analyzer', 'zls' }-- Add your desired servers
        })
        local lspconfig = require('lspconfig')

        -- rust
        lspconfig.rust_analyzer.setup({
            settings =  {
                ["rust-analyzer"] = {
                    inlayHints = {
                        enable = true,
                        typeHints = true,
                        parameterHints = true,
                        chainingHints = true,
                    }

                }
            }
        })

        -- wgsl
        vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        pattern = "*.wgsl",
        callback = function()
            vim.bo.filetype = "wgsl"
        end,
        })
        lspconfig.wgsl_analyzer.setup({
            on_attach = function(client, bufnr)
                if client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(bufnr, true)
                end
            end,
            settings = {
                zls = {
                    inlayHints = {
                        enable = true, -- Enables inlay hints globally
                        typeHints = true, -- Show type hints
                        parameterHints = true, -- Show parameter hints
                    }
                }
            }
        })
        lspconfig.zls.setup({})
        lspconfig.pyright.setup({})
    end
}
