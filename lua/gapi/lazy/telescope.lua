return {
    'nvim-telescope/telescope.nvim', 
    dependencies = { 
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim'
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require('telescope.builtin')

        telescope.load_extension("file_browser")
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end,
}

