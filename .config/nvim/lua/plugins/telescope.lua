return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = "move_selection_next",
            ["<C-j>"] = "move_selection_previous",
            ["<C-H>"] = "find_files_with_hidden",
            ["<C-L>"] = "find_lsp_references",
          },
        },
      },
    },
  },
}
