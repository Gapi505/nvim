return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<leader>t]], -- Toggle with <leader>t
      direction = "horizontal", -- Can be "float", "horizontal", or "vertical"
      size = 10, -- Terminal height
      shade_terminals = true, -- Enable shading for better color support
      persist_size = true,
      start_in_insert = true, -- Start terminal in insert mode
      insert_mappings = false,
    })

    -- Open terminal directly with cargo run
    vim.keymap.set("n", "<leader>cr", function()
      require("toggleterm.terminal").Terminal
        :new({ cmd = "cargo run", hidden = true })
        :toggle()
    end, { desc = "Run Cargo in Terminal" })
  end,
}

