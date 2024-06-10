return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local theme = function()
      local colors = {
        darkgray = "#16161d",
        gray = "#727169",
        white = "#ffffff",
        innerbg = nil,
        outerbg = nil,
        normal = "#7e9cd8",
        insert = "#98bb6c",
        visual = "#ffa066",
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
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = theme,
        component_separators = '',
        -- component_separators = '|',
        -- section_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
    })
  end
}
