return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false, -- This plugin is already lazy
  config = function ()
    vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {
        enable_clippy = false
    },
    -- LSP configuration
    server = {
      on_attach = function(client, bufnr)
        -- you can also put keymaps in here
      end,
      tools = {
          enable_clippy = false
      },
      default_settings = {
        -- rust-analyzer language server configuration
        ['rust-analyzer'] = {
        },
      },
    },
    -- DAP configuration
    dap = {
    },
  }
  end
}
