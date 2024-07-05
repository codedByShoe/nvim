return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local utils = require("user.core.utils")
    local icons = require("user.core.icons")
    local copilot_colors = {
      [""] = utils.get_hlgroup("Comment"),
      ["Normal"] = utils.get_hlgroup("Comment"),
      ["Warning"] = utils.get_hlgroup("DiagnosticError"),
      ["InProgress"] = utils.get_hlgroup("DiagnosticWarn"),
    }
    -- custom theme
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
        lualine_b = { { "branch", icon = icons.git.Branch } },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error .. " ",
              warn = icons.diagnostics.Warning .. " ",
              info = icons.diagnostics.Information .. " ",
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true,                 separator = "", padding = { left = 1, right = 0 } },
          { "filename", padding = { left = 1, right = 0 } },
          {
            function()
              local buffer_count = require("user.core.utils").get_buffer_count()

              return " +" .. buffer_count - 1 .. " " .. icons.ui.Files
            end,
            cond = function()
              return require("user.core.utils").get_buffer_count() > 1
            end,
            color = utils.get_hlgroup("Operator", nil),
            padding = { left = 0, right = 1 },
          },
          {
            function()
              return require("nvim-navic").get_location()
            end,
            cond = function()
              return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
            end,
            color = utils.get_hlgroup("Comment", nil),
          },
        },
        lualine_x = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = utils.get_hlgroup("String"),
          },
          {
            function()
              local icon = " " .. icons.git.Octoface
              local status = require("copilot.api").status.data
              return icon .. (status.message or "")
            end,
            cond = function()
              local ok, clients = pcall(vim.lsp.get_clients, { name = "copilot", bufnr = 0 })
              return ok and #clients > 0
            end,
            color = function()
              if not package.loaded["copilot"] then
                return
              end
              local status = require("copilot.api").status.data
              return copilot_colors[status.status] or copilot_colors[""]
            end,
          },
          { "diff" },
        },
        lualine_y = {
          {
            "progress",
          },
          {
            "location",
            color = utils.get_hlgroup("Boolean"),
          },
        },
        lualine_z = {
          {
            "datetime",
            style = icons.ui.Clock .. " %X",
          },
        },
      },

      extensions = { "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
    }
  end,
}
