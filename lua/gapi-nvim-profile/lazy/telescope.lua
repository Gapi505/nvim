return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim'
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require('telescope.builtin')

    -- This is where you actually setup Telescope's options
    telescope.setup {
      defaults = {
        -- You can put global defaults here if you want
        -- For example, if you wanted 'fd' to always include hidden files
        -- in all pickers that use it:
        -- find_command = { 'fd', '--type', 'f', '--hidden', '--exclude', '.git' },
      },
      extensions = {
        file_browser = {
          -- This is specifically for the file_browser extension.
          -- When you call :Telescope file_browser, it will use these settings.
          -- Assuming you have 'fd' installed (which you should, it's superior to 'find')
          fd_opts = {
            '--type', 'f',
            '--type', 'd',
            '--hidden', -- <<----- The magic you were missing, you ape!
            '--exclude', '.git', -- Good idea to keep this one
          },
          -- If you absolutely insist on using 'find' (may the gods have mercy on your soul):
          -- find_opts = {
          --   '-L',
          --   '-type', 'f',
          --   '-not', '-path', '*/.git/*',
          --   '-not', '-name', '.git',
          --   '(', '-path', '*/.*', '-o', '-name', '.*', ')' -- This is how 'find' includes hidden files/dirs
          -- }
        }
      }
    }

    telescope.load_extension("file_browser")
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

    -- You probably want a keymap for the file_browser itself, otherwise what's the point?
    vim.keymap.set('n', '<leader>pf', function()
      telescope.extensions.file_browser.file_browser()
    end, { desc = 'Telescope File Browser' })
  end,
}
