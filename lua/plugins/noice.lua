require('noice').setup({
	views = {
      cmdline_popup = {
        position = {
          row = 3,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
		border = {
          style = "none",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { "NormalFloat:NormalFloat, FloatBorder:FloatBorder" },
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = 8,
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
    },
	routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
    },
})
