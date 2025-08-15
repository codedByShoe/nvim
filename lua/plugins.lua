-- ============================================================================
-- Add plugins native package manager
-- ============================================================================
-- UI PLugins
-- Setup colorscheme
vim.pack.add({
	{ src = "https://github.com/olimorris/onedarkpro.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/wakatime/vim-wakatime" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/catgoose/nvim-colorizer.lua" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/saghen/blink.cmp", version = "v1.6.0" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
})

require("onedarkpro").setup({
	options = {
		transparency = true,
	},
})

require("lualine").setup({
	options = {
		theme = "onedark",
	},
})

require("bufferline").setup()

-- treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = { "php", "typescript", "javascript", "ruby", "go", "bash", "c", "html", "css", "lua" },
	highlight = { enable = true },
})

vim.lsp.config("jsonls", {
	cmd = { "vscode-json-languageserver", "--stdio" },
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemerty = { enabled = false },
		},
	},
})

vim.lsp.enable({
	"lua_ls",
	"pyright",
	"clangd",
	"intelephense",
	"ts_ls",
	"gopls",
	"ruby_lsp",
	"emmet_ls",
	"jsonls",
	"svelte",
})

-- conform format on save
require("conform").setup({
	formatters_by_ft = {
		json = { "prettier" },
		php = { "php_cs_fixer" },
		lua = { "stylua" },
		ruby = { "rubyfmt" },
		python = { "ruff" },
		svelte = { "prettier" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

-- setup completion
require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup({
	signature = { enabled = true },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
	},
	fuzzy = {},
})

-- create autocomand for format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

require("nvim-autopairs").setup()
require("colorizer").setup()

-- snacks to pick up the rest
local snacks = require("snacks")
snacks.setup({
	bigfile = { enabled = true },
	dashboard = {
		enabled = true,
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
			{ section = "keys", gap = 1, padding = 1 },
			-- { section = "startup" },
		},
	},
	explorer = { enabled = true },
	indent = { enabled = true },
	input = { enabled = true },
	notifier = {
		enabled = true,
		timeout = 3000,
	},
	picker = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	styles = {
		notification = {
			-- wo = { wrap = true } -- Wrap notifications
		},
	},
})

require("render-markdown").setup()
require("fidget").setup({
	notification = {
		window = {
			winblend = 0,
		},
	},
})
