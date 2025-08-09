return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java", -- Ensure it's loaded for Java files
    config = function()
      local jdtls = require("jdtls")

      -- Define the configuration for jdtls
      local config = {
        cmd = { "/home/ubuntu/.local/share/nvim/mason/bin/jdtls" },
        root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
      }

      -- Start or attach to the language server
      jdtls.start_or_attach(config)
    end,
  },
}
