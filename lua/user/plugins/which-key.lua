return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		require("which-key").setup({
			spec = {
				{ "<leader>d", group = "[D]ebug" },
				{ "<leader>g", group = "[G]o to" },
				{ "<leader>r", group = "[R]ename" },
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>w", group = "[W]indow" },
				{ "<leader>t", group = "[T]oggle" },
			},
		})
	end,
}
