return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local theme = function()
      local colors = {
        darkgray = "#16161d",
        gray = "#727169",
        white = "#DCD7BA",
        innerbg = nil,
        outerbg = nil,
        normal = "#7E9CD8",
        insert = "#98bb6c",
        visual = "#FF9E3B",
        replace = "#e46876",
        command = "#e6c384",
      }
      return {
        inactive = {
          a = { fg = colors.white, bg = colors.outerbg, gui = "bold" },
          b = { fg = colors.white, bg = colors.outerbg },
          c = { fg = colors.white, bg = colors.innerbg },
        },
        visual = {
          a = { fg = colors.visual, bg = colors.outerbg, gui = "bold" },
          b = { fg = colors.white, bg = colors.outerbg },
          c = { fg = colors.white, bg = colors.innerbg },
        },
        replace = {
          a = { fg = colors.darkgray, bg = colors.outerbg, gui = "bold" },
          b = { fg = colors.white, bg = colors.outerbg },
          c = { fg = colors.white, bg = colors.innerbg },
        },
        normal = {
          a = { fg = colors.normal, bg = colors.outerbg, gui = "bold" },
          b = { fg = colors.white, bg = colors.outerbg },
          c = { fg = colors.white, bg = colors.innerbg },
        },
        insert = {
          a = { fg = colors.insert, bg = colors.outerbg, gui = "bold" },
          b = { fg = colors.white, bg = colors.outerbg },
          c = { fg = colors.white, bg = colors.innerbg },
        },
        command = {
          a = { fg = colors.command, bg = colors.outerbg, gui = "bold" },
          b = { fg = colors.white, bg = colors.outerbg },
          c = { fg = colors.white, bg = colors.innerbg },
        },
      }
    end

    return {
      options = {
        component_separators = { left = " ", right = " " },
        section_separators = { left = " ", right = " " },
        theme = theme,
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha" } },
      },
      sections = {
        lualine_a = { { "mode", icon = "" } },
      },

      extensions = { "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
    }
  end,
}
