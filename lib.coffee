_ = require 'lodash'
Table = require 'cli-table'
functionToString = require 'function-to-string'

module.exports = (variables, expressions) ->

  expressionStrings = expressions.map (e) ->
    return e.outputName if e.outputName
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
    vars.reverse()

    answers = expressions.map (e) -> e.apply(this, vars)

    row = vars.concat(answers).map (val) -> if val then 'T' else 'F'
    table.push(row)

  console.log(table.toString())
