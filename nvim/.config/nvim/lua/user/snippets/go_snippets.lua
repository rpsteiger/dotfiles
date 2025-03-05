local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('go', {
  s('main', {
    t {
      'package main',
      '',
      'import (',
      '    "fmt"',
      ')',
      '',
      'func main() {',
      '    ',
    },
    i(0), -- This is where the cursor will be placed
    t {
      '',
      '}',
    },
  }),
})
