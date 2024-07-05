return {
  "codedbyshoe/rest.nvim",
  dependencies = { "luarocks.nvim" },
  config = function()
    require("rest-nvim").setup()
  end
}
