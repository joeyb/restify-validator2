restify = require('restify')
util = require('util')

ValidationError = (errors) ->
  restify.HttpError.call(this, {
    constructorOpt: ValidationError
    statusCode: 400
    body: {
      code: 'ValidationError'
      errors: errors
    }
  })

util.inherits(ValidationError, restify.HttpError)
