local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets("php", {
  -- php public function
  s("pubf", fmt(
    [[
        public function {}({}): {} {{
          {}
        }}
    ]], { i(1), i(2), i(3), i(0) })),

})
