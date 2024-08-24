-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal' },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Ensures all items are displayed in the tree
        hide_dotfiles = false, -- Dotfiles are shown
        hide_gitignored = false, -- Git-ignored files are shown
        hide_hidden = false, -- Hidden files are shown
        never_show = {}, -- Keep this empty to display all items
        hide_by_name = { -- List of directories to ignore during filtering/searching
          'node_modules',
          '.git',
          'vendor'
          -- Add more directories as needed
        },
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
    event_handlers = {
      {
        event = 'file_open_requested',
        handler = function()
          -- auto close Neo-tree when a file is opened
          require('neo-tree.command').execute { action = 'close' }
        end,
      },
    },
  },
}
