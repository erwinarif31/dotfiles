return {
  "MagicDuck/grug-far.nvim",
  version = "1.6.3",
  opts = { headerMaxWidth = 80 },
  cmd = "GrugFar",
  keys = {
    {
      "<leader>sr",
      function()
        local grug = require("grug-far")
        grug.open({
          transient = true,
          prefills = {
            -- This is the important part: we give the exact path of the current file.
            paths = vim.fn.expand("%:p"),
          },
        })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace (Buffer)",
    },
    {
      "<leader>sR",
      function()
        local grug = require("grug-far")
        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
        grug.open({
          transient = true,
          prefills = {
            filesFilter = ext and ext ~= "" and "*." .. ext or nil,
          },
        })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace",
    },
  },
}
