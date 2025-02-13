return {
   "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        local neotree = require("neo-tree.command")

        -- Show & focus NeoTree
        vim.keymap.set("n", "<leader>e", function() neotree.execute({ toggle = false, reveal = true }) end, { desc = "Toggle NeoTree & Focus" })

        -- Hide NeoTree (move focus to editor)
        vim.keymap.set("n", "<leader>q", "<cmd>wincmd p<CR>", { desc = "Focus Editor from NeoTree" })

        -- Close NeoTree completely
        vim.keymap.set("n", "<leader>x", function() neotree.execute({ action = "close" }) end, { desc = "Close NeoTree" })
    end,
}
