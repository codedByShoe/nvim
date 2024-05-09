-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('tokyonight').setup({
--       style = 'night',
--       transparent = true,
--       styles = {
--         sidebars = "transparent",
--         floats = "transparent",
--         comments = { italic = true },
--         keywords = { italic = true },
--       },
--        lualine_bold = true,
--     })
--     vim.cmd("colorscheme tokyonight")
--   end
--
-- }

-- return {
--     "olimorris/onedarkpro.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require('onedarkpro').setup({
--             highlights = {
--                 Comment = { italic = true },
--                 Directory = { bold = true },
--                 ErrorMsg = { italic = true, bold = true }
--             },
--             options = {
--                 transparency = true
--             },
--             styles = {
--                 types = "italic",
--                 methods = "NONE",
--                 numbers = "NONE",
--                 strings = "NONE",
--                 comments = "italic",
--                 keywords = "italic",
--                 constants = "NONE",
--                 functions = "italic",
--                 operators = "NONE",
--                 variables = "NONE",
--                 parameters = "NONE",
--                 conditionals = "italic",
--                 virtual_text = "NONE",
--             },
--         })
--
--         vim.cmd("colorscheme onedark")
--     end
--
-- }

return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            transparent = true,
            italic_comments = true,
            hide_fillchars = true,
            borderless_telescope = true,
            terminal_colors = true,
        })
        vim.cmd("colorscheme cyberdream") -- set the colorscheme
    end,
}
