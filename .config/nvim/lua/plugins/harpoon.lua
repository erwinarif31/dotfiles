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
        "<leader>H",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon File",
      },
      {
        "<leader>h",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      },
      {
        "<leader>j",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "Harpoon to File 1",
      },
      {
        "<leader>k",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "Harpoon to File 2",
      },
      {
        "<leader>l",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "Harpoon to File 3",
      },
      {
        "<leader>;",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "Harpoon to File 4",
      },
      {
        "<leader>m",
        function()
          require("harpoon"):list():select(5)
        end,
        desc = "Harpoon to File 5",
      },
      {
        "<leader>1",
        function()
          require("harpoon"):list():select(6)
        end,
        desc = "Harpoon to File 6",
      },
      {
        "<leader>2",
        function()
          require("harpoon"):list():select(7)
        end,
        desc = "Harpoon to File 7",
      },
      {
        "<leader>3",
        function()
          require("harpoon"):list():select(8)
        end,
        desc = "Harpoon to File 8",
      },
      {
        "<leader>4",
        function()
          require("harpoon"):list():select(9)
        end,
        desc = "Harpoon to File 9",
      },
      {
        "<leader>5",
        function()
          require("harpoon"):list():select(10)
        end,
        desc = "Harpoon to File 10",
      },
    }

    return keys
  end,
}
