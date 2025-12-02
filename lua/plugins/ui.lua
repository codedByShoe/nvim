MiniDeps.now(function()
	MiniDeps.add({
		source = "scottmckendry/cyberdream.nvim",
	})

	require("cyberdream").setup({
		transparent = true,
		saturation = 0.7,
		italic_comments = true,
		hide_fillchars = true,
	})
	vim.cmd("colorscheme cyberdream")
end)

MiniDeps.now(function()
	require("mini.tabline").setup()
end)

MiniDeps.later(function()
	require("mini.ai").setup()
	require("mini.comment").setup()
	require("mini.pick").setup()
	require("mini.surround").setup()
	require("mini.pairs").setup()

	local miniclue = require("mini.clue")
	miniclue.setup({
		triggers = {
			-- Leader triggers
			{ mode = "n", keys = "<Leader>" },
			{ mode = "x", keys = "<Leader>" },

			-- Built-in completion
			{ mode = "i", keys = "<C-x>" },

			-- `g` key
			{ mode = "n", keys = "g" },
			{ mode = "x", keys = "g" },

			-- Marks
			{ mode = "n", keys = "'" },
			{ mode = "n", keys = "`" },
			{ mode = "x", keys = "'" },
			{ mode = "x", keys = "`" },

			-- Registers
			{ mode = "n", keys = '"' },
			{ mode = "x", keys = '"' },
			{ mode = "i", keys = "<C-r>" },
			{ mode = "c", keys = "<C-r>" },

			-- Window commands
			{ mode = "n", keys = "<C-w>" },

			-- `z` key
			{ mode = "n", keys = "z" },
			{ mode = "x", keys = "z" },
		},
		clues = {
			-- Enhance this by MiniDeps.adding descriptions for <Leader> mapping groups
			miniclue.gen_clues.builtin_completion(),
			miniclue.gen_clues.g(),
			miniclue.gen_clues.marks(),
			miniclue.gen_clues.registers(),
			miniclue.gen_clues.windows(),
			miniclue.gen_clues.z(),
		},
	})
end)

MiniDeps.now(function()
	MiniDeps.add({
		source = "folke/snacks.nvim",
	})

	---@type snacks.Config
	require("snacks").setup({
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			example = "github",
			keys = {
				{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
				{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
				{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
				{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
				{
					icon = " ",
					key = "c",
					desc = "Config",
					action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
				},
				{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
				{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
			},
			sections = {
				{ section = "header" },
				{
					pane = 2,
					section = "terminal",
					cmd = "colorscript -e square",
					height = 5,
					padding = 1,
				},
				{ section = "keys", gap = 1, padding = 1 },
				{
					pane = 2,
					icon = " ",
					desc = "Browse Repo",
					padding = 1,
					key = "b",
					action = function()
						Snacks.gitbrowse()
					end,
				},
				function()
					local in_git = Snacks.git.get_root() ~= nil
					local cmds = {
						{
							title = "Notifications",
							cmd = "gh notify -s -a -n5",
							action = function()
								vim.ui.open("https://github.com/notifications")
							end,
							key = "n",
							icon = " ",
							height = 5,
							enabled = true,
						},
						{
							title = "Open Issues",
							cmd = "gh issue list -L 3",
							key = "i",
							action = function()
								vim.fn.jobstart("gh issue list --web", { detach = true })
							end,
							icon = " ",
							height = 7,
						},
						{
							icon = " ",
							title = "Open PRs",
							cmd = "gh pr list -L 3",
							key = "P",
							action = function()
								vim.fn.jobstart("gh pr list --web", { detach = true })
							end,
							height = 7,
						},
						{
							icon = " ",
							title = "Git Status",
							cmd = "git --no-pager diff --stat -B -M -C",
							height = 10,
						},
					}
					return vim.tbl_map(function(cmd)
						return vim.tbl_extend("force", {
							pane = 2,
							section = "terminal",
							enabled = in_git,
							padding = 1,
							ttl = 5 * 60,
							indent = 3,
						}, cmd)
					end, cmds)
				end,
			},
		},
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		picker = {
			enabled = true,
			layout = "custom",
			layouts = {
				custom = {
					layout = {
						box = "vertical",
						backdrop = { transparent = true },
						row = -1,
						width = 0,
						height = 0.4,
						border = "none",
						title = " {title} {live} {flags}",
						title_pos = "left",
						{
							box = "horizontal",
							{ win = "list", border = "rounded" },
							{ win = "preview", title = "{preview}", width = 0.6, border = "rounded" },
						},
						{ win = "input", height = 1, border = "top" },
					},
				},
			},
		},
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	})
end)

MiniDeps.later(function()
	MiniDeps.add({
		source = "https://github.com/j-hui/fidget.nvim",
	})
	require("fidget").setup({
		notification = {
			window = {
				winblend = 0,
			},
		},
	})
end)

MiniDeps.later(function()
	MiniDeps.add({
		source = "nvim-lualine/lualine.nvim",
		depends = { "nvim-tree/nvim-web-devicons" },
	})

	require("lualine").setup({
		theme = "auto",
		options = {
			section_separators = { left = " ", right = " " },
			component_separators = { left = "", right = "" },
		},
	})
end)

MiniDeps.later(function()
	MiniDeps.add({
		source = "catgoose/nvim-colorizer.lua",
	})

	require("colorizer").setup({
		lazy_load = true,
		user_default_options = {
			names = false,
			virtualtext = "",
			mode = "virtualtext",
			virtualtext_inline = "before",
			tailwind = true,
			names_opts = {
				lowercase = true,
				camelcase = true,
				uppercase = false,
				strip_digits = false,
			},
		},
	})
end)
