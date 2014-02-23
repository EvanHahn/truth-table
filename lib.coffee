_ = require 'lodash'
Table = require 'cli-table'

module.exports = (variables, expressions) ->

  expressionStrings = expressions.map (e) -> e.toString()
  table = new Table
    head: variables.concat expressionStrings

  rowCount = Math.pow(2, variables.length)
  _(rowCount).times (n) ->

    vars = []
    _(variables.length).times (m) ->
      andWith = Math.pow(2, m)
      vars.push((n & andWith) != 0)

    answers = expressions.map (e) -> e.apply(this, vars)

    row = vars.concat(answers)
    table.push(row)

  console.log(table.toString())
