return {
	"glepnir/dashboard-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local icons = require("user.core.icons")
		require("dashboard").setup({
			theme = "doom",
			config = {
				header = {
					[[                                                       ]],
					[[                                                       ]],
					[[                                                       ]],
					[[    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
					[[    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
					[[    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
					[[    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
					[[    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
					[[    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
					[[                                                       ]],
					[[                                                       ]],
				},
				center = {
					{
						icon = icons.ui.NewFile .. " ",
						desc = "New File               ",
						key = "Space + te",
						action = "Neotree reveal toggle",
					},
					{
						icon = icons.ui.FindFile .. " ",
						desc = "Search Files               ",
						key = "Space + sf",
						action = "Telescope find_files",
					},
					{
						icon = icons.ui.History .. " ",
						desc = "Search History            ",
						key = "Space + sh",
						action = "Telescope oldfiles",
					},
					{
						icon = icons.ui.File .. " ",
						desc = "Search Grep               ",
						key = "Space + sg",
						action = "Telescope live_grep",
					},
				},
			},
			hide = {
				statusline = false,
				tabline = false,
				winbar = false,
			},
		})
	end,
}
