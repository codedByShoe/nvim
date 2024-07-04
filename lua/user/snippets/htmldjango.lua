local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("htmldjango", {
  -- django / flask for loop
  s("for", fmt(
    [[
        {{% for {} in {} %}}
          {}
        {{% endfor %}}
    ]], { i(1), i(2), i(0) })),

  -- django / flask if statement
  s("if", fmt(
    [[
        {{% if {} %}}
          {}
        {{% endif %}}
    ]], { i(1), i(2) })),

  -- django / flask output
  s("var", fmta("{{ <> }}", { i(1) })),
})
