return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  opts = {
    editor = {
      tooltip = "Neovim",
    },
    text = {
      workspace = function(opts)
        local prefix = "Working on "
        local name = opts.workspace
        if #name > 3 then
          name = name:sub(1, 3) .. "***"
          return prefix .. name
        else
          return prefix .. name
        end
      end,
    },
    idle = {
      timeout = 900000,
      icon = "https://i.redd.it/6iyv539zemb41.jpg",
    },
    display = {
      theme = "catppuccin",
      flavor = "accent",
    },
  },
}
