Validator = require('validator').Validator
Filter = require('validator').Filter

restifyValidator = (req, res, next) ->

  req.check = (values, name, failMessage) ->
    validator = new Validator()
    value = values?[name]

    validator.error = (message) ->
      error = {
        values: values
        name: name
        message: message
      }

      req._validationErrors ?= []
      req._validationErrors.push(error)

      req.onValidatonError?(error)

    return validator.check(value, failMessage)

  return next()

module.exports = restifyValidator