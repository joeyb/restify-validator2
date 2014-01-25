restify = require('restify')
util = require('util')

ValidatorError = (errors) ->
  restify.HttpError.call(this, {
    constructorOpt: ValidatorError
    statusCode: 400
    body: {
      code: 'ValidatorError'
      errors: errors
    }
  })

util.inherits(ValidatorError, restify.HttpError)

module.exports = ValidatorError

