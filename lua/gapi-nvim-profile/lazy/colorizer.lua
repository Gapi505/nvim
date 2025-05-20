return {
  "NvChad/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      filetypes = { "*" }, -- enable for all
      user_default_options = {
        names = false, -- also colorize named colors like "red", "blue"
      },
    })
  end,
}
