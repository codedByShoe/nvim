-- lsp setup and tools
MiniDeps.now(function()
	-- Use other plugins with `MiniDeps.add()`. It ensures plugin is available in current
	-- session (installs if absent)
	MiniDeps.add({
		source = "mason-org/mason-lspconfig.nvim",
		-- Supply dependencies near target plugin
		depends = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
	})

	require("mason").setup()
	require("mason-lspconfig").setup()

	vim.lsp.inlay_hint.enable()

	vim.lsp.config("gopls", {
		settings = {
			gopls = {
				hints = {
					rangeVariableTypes = true,
					parameterNames = true,
					constantValues = true,
					assignVariableTypes = true,
					compositeLiteralFields = true,
					compositeLiteralTypes = true,
					functionTypeParameters = true,
				},
			},
		},
	})

	vim.lsp.config("lua_ls", {
		settings = {
			Lua = {
				hint = { enable = true },
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

	vim.lsp.config("clangd", {
		settings = {
			clangd = {
				InlayHints = {
					Designators = true,
					Enabled = true,
					ParameterNames = true,
					DeducedTypes = true,
				},
				fallbackFlags = { "-std=c++20" },
			},
		},
	})

	local vue_language_server_path = vim.fn.stdpath("data")
		.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
	local vue_plugin = {
		name = "@vue/typescript-plugin",
		location = vue_language_server_path,
		languages = { "vue" },
		configNamespace = "typescript",
	}
	vim.lsp.config("vtsls", {
		settings = {
			vtsls = {
				tsserver = {
					globalPlugins = {
						vue_plugin,
					},
				},
			},
			typescript = {
				inlayHints = {
					parameterNames = { enabled = "all" },
					parameterTypes = { enabled = true },
					variableTypes = { enabled = true },
					propertyDeclarationTypes = { enabled = true },
					functionLikeReturnTypes = { enabled = true },
					enumMemberValues = { enabled = true },
				},
			},
		},
		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	})

	MiniDeps.add({
		source = "WhoIsSethDaniel/mason-tool-installer.nvim",
	})

	require("mason-tool-installer").setup({
		ensure_installed = {
			"lua-language-server",
			"typescript-language-server",
			"gopls",
			"gofumpt",
			"emmet-ls",
			"bash-language-server",
			"vue-language-server",
			"tailwindcss-language-server",
			"vtsls",
			"json-lsp",
			"css-lsp",
			"clangd",
			"intelephense",
			"yaml-language-server",
			"goimports",
			"stylua",
			"marksman",
		},
	})
end)

-- autoformatting
MiniDeps.now(function()
	MiniDeps.add({
		source = "stevearc/conform.nvim",
	})

	require("conform").setup({
		formatters_by_ft = {
			json = { "prettier" },
			vue = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			php = { "php-cs-fixer" },
		},
		format_on_save = {
			timeout_ms = 2500,
			lsp_format = "fallback",
		},
	})
end)

MiniDeps.now(function()
	MiniDeps.add({
		source = "saghen/blink.cmp",
		checkout = "1.8.0",
		depends = { "rafamadriz/friendly-snippets" },
	})

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
		fuzzy = { implementation = "lua" },
	})
end)

-- Syntax highlighting
MiniDeps.later(function()
	MiniDeps.add({
		source = "nvim-treesitter/nvim-treesitter",
		-- Use 'master' while monitoring updates in 'main'
		checkout = "master",
		monitor = "main",
		-- Perform action after every checkout
		hooks = {
			post_checkout = function()
				vim.cmd("TSUpdate")
			end,
		},
	})
	-- Possible to immediately execute code which depends on the MiniDeps.added plugin
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"lua",
			"vimdoc",
			"bash",
			"php",
			"tsx",
			"javascript",
			"go",
			"html",
			"css",
			"c",
		},
		highlight = { enable = true },
	})
end)

MiniDeps.later(function()
	MiniDeps.add({
		source = "adalessa/laravel.nvim",
		depends = {
			"tpope/vim-dotenv",
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-neotest/nvim-nio",
			"ravitemer/mcphub.nvim", -- optional
		},
		hooks = {
			post_checkout = function()
				vim.cmd("Laravel")
			end,
		},
	})

	require("laravel").setup({
		features = {
			pickers = {
				provider = "snacks",
			},
		},
	})
end)

MiniDeps.later(function()
	MiniDeps.add({
		source = "windwp/nvim-ts-autotag",
	})

	require("nvim-ts-autotag").setup()
end)
