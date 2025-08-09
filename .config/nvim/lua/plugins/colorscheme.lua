return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- Ensure the plugin loads immediately
    priority = 1000, -- Load before other plugins
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(highlights, colors)
        highlights.CursorLineNr = {
          fg = colors.blue, -- Distinct color for current line number
          bold = true,
        }
        highlights.LineNrAbove = {
          fg = colors.blue0,
        }
        highlights.LineNrBelow = {
          fg = colors.blue0,
        }
      end,
    },
  },
}
