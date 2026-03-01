return {
  "askfiy/smart-translate.nvim",
  cmd = { "Translate" },
  dependencies = {
    "askfiy/http.nvim", -- a wrapper implementation of the Python aiohttp library that uses CURL to send requests.
  },
  keys = {
    { "<leader>tr", "<cmd>Translate<cr>", mode = { "n", "v" }, desc = "Translate" },
    { "<leader>tR", "<cmd>Translate replace<cr>", mode = "v", desc = "Translate and Replace" },
  },
  opts = {
    default = {
      cmd = {
        source = "auto",
        target = "en",
        engine = "google",
        handle = "float",
      },
    },
  },
}
