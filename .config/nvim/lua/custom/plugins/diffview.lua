return {
  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    keys = {
      {
        '<leader>gd',
        function()
          local lib = require 'diffview.lib'
          local view = lib.get_current_view()
          if view then
            vim.cmd 'DiffviewClose'
          else
            vim.cmd 'DiffviewOpen'
          end
        end,
        desc = 'Toggle Diffview',
      },
    },
    config = function()
      local actions = require 'diffview.actions'
      require('diffview').setup {
        keymaps = {
          view = {
            -- Staging keymaps
            {
              'n',
              '-',
              actions.toggle_stage_entry,
              { desc = 'Stage/unstage file' },
            },
          },
          file_panel = {
            {
              'n',
              '-',
              actions.toggle_stage_entry,
              { desc = 'Stage/unstage file' },
            },
            {
              'n',
              'cc',
              '<Cmd>Git commit<CR>',
              { desc = 'Create commit' },
            },
          },
        },
      }
    end,
  },
}
