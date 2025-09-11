return {
  'Gapi505/maud-fmt.nvim',
  branch = "feature/multi-html-block-support",
  config = function()
    require("maud-fmt").setup({
      indent_size = 4,  -- Default indentation size (spaces)
      keymaps = {
        format = '<leader>mf',  -- Keymap to format the current buffer
      },
    })
  end,
  ft = "rust",  -- Only load for Rust files
}
