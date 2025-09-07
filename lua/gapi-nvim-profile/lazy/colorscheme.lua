return {
  -- Your existing TokyoDark setup - MAKE IT NOT LAZY IF IT'S YOUR DEFAULT!
  {
    "tiagovla/tokyodark.nvim",
    lazy = false, -- <--- CHANGE THIS TO FALSE, YOU IMBECILE!
    priority = 1000, -- Optional, but ensures it loads early
    opts = {
      -- custom options here from your original config
    },
    config = function(_, opts)
      require("tokyodark").setup(opts)
      -- Apply TokyoDark as the initial default theme here.
      -- This ensures it's loaded and set when Neovim starts.
      vim.cmd.colorscheme("tokyodark")
    end,
  },

  -- New: Gruvbox.nvim setup (can be lazy as you'll switch to it)
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- Keep this lazy as you only switch to it
    opts = {
      transparent_mode = false,
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        comments = true,
        keywords = false,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_sidebar = false,
      palette_overrides = {},
      dim_inactive = false,
      contrast = "hard",
    },
    config = function(_, opts)
      require("gruvbox").setup(opts)
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false, -- Keep this lazy as you only switch to it
    config = function ()
      require("kanagawa").setup({})
    end
  },
}
