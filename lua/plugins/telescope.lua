return {
  "nvim-telescope/telescope.nvim",
  keys = function()
    return {}
  end,
  -- change some options
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          -- set to `false` if you want the input to be on the left and
          -- preview on the right
          prompt_position = "top",
          mirror = false,
          width = { padding = 0 },
          height = { padding = 0 },
          preview_cutoff = 100,
          preview_width = 0.5,
        },
      },
      sorting_strategy = "ascending",
      winblend = 0,
      prompt_prefix = " ",
      selection_caret = " ",
      path_display = { "smart" },
      file_ignore_patterns = { "node_modules", "vendor", "__pycache__", "obj" },
    },
  },
}
