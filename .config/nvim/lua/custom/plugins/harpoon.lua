return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
    },
  },
  keys = function()
    local keys = {
      {
        "<leader>a",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon File",
      },
      {
        "<leader>v",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      },
      {
        "<C-j>",
        function()
          local harpoon = require("harpoon")
          harpoon:list():select(1)
        end,
      },
      {
        "<C-k>",
        function()
          local harpoon = require("harpoon")
          harpoon:list():select(2)
        end,
      },
      {
        "<C-l>",
        function()
          local harpoon = require("harpoon")
          harpoon:list():select(3)
        end,
      },
      {
        "<C-;>",
        function()
          local harpoon = require("harpoon")
          harpoon:list():select(4)
        end,
      },
      {
        "<C-n>",
        function()
          local harpoon = require("harpoon")
          harpoon:list():select(5)
        end,
      },
      {
        "<C-m>",
        function()
          local harpoon = require("harpoon")
          harpoon:list():select(6)
        end,
      },
    }

    return keys
  end,
}
