return {
  "Selyss/mind.nvim",
  branch = "v2.2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, used for icons
  },
  opts = {
    ui = {
      -- split to open window in
      position = "left",

      -- commands used to open URLs
      url_open = url_open,

      -- default width of the tree view window
      width = 30,

      -- should mind window be closed when a file is opened
      close_on_file_open = false,

      -- marker used to identify the root of the tree (left to its name)
      root_marker = "3",

      -- marker used to identify a local root (right to its name)
      local_marker = "local",

      -- marker used to show that a node has an associated data file
      data_marker = "  ",

      -- marker used to show that a node has an URL
      url_marker = " ",

      -- highlight options
      highlight = {
        -- highlight used on closed marks
        closed_marker = "LineNr",

        -- highlight used on open marks
        open_marker = "LineNr",

        -- highlight used on the name of the root node
        node_root = "Function",

        -- highlight used on regular nodes with no children
        node_leaf = "String",

        -- highlight used on regular nodes with children
        node_parent = "Title",

        -- highlight used on the local marker
        local_marker = "Comment",

        -- highlight used on the data marker
        data_marker = "Comment",

        -- highlight used on the url marker
        url_marker = "Comment",

        -- highlight used on empty nodes (i.e. no children and no data)
        modifier_empty = "Comment",

        -- highlight used on the selection marker
        select_marker = "Error",
      },
      icon_preset = {
        { "a ", "Sub-project" },
        { "b ", "Journal, newspaper, weekly and daily news" },
        { "c ", "For when you have an idea" },
        { "󰎞 ", "Note taking?" },
        { "d ", "Task management" },
        { " ", "Uncheck, empty square or backlog" },
        { " ", "Full square or on-going" },
        { " ", "Check or done" },
        { "g ", "Trash bin, deleted, cancelled, etc." },
        { "h ", "GitHub" },
        { "i ", "Monitoring" },
        { "j ", "Internet, Earth, everyone!" },
        { "k ", "Frozen, on-hold" },
      },
    },
  },
}
