table = require './lib'

table ['P', 'Q'], [
  (p, q) -> (!p) or q
  (p, q) -> !((!q) or p)
  (p, q) -> ((!p) or q) == !((!q) or p)
]
