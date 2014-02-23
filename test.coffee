table = require './lib'

table ['P', 'Q'], [
  (P, Q) -> (!P) or Q
  (P, Q) -> !((!Q) or P)
  (P, Q) -> ((!P) or Q) == !((!Q) or P)
]
