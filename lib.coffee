_ = require 'lodash'
Table = require 'cli-table'
functionToString = require 'function-to-string'

module.exports = (variables, expressions) ->

  expressionStrings = expressions.map (e) ->
    parsed = functionToString(e)
    cleanedBody = parsed.body.replace(/\s/g, '')
    cleanedBody = cleanedBody.replace(/^return/g, '')
    cleanedBody = cleanedBody.replace(/;$/g, '')
    return cleanedBody

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
