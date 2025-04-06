local wk = require("which-key")
wk.add({
    {
        mode = {"n", "v", "i", "x"},
        {"<Up>", "<Nop>"},
        {"<Down>", "<Nop>"},
        {"<Left>", "<Nop>"},
        {"<Right>", "<Nop>"},
    },
    {
        mode = "n",
        silent = true,
        {"<Esc>", ":noh<CR>", desc = "Clear search highlight"},
    },
    {
        mode = "n",
        {"<leader>rn", vim.lsp.buf.rename, desc = "Rename variable"},
        {"<leader>th", vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()), desc = "Toggle inlay hints"},
        {"<C-k>", vim.lsp.buf.signature_help, desc = "LSP Signature help"},
    }
})
