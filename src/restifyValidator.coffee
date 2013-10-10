Validator = require('validator').Validator
Filter = require('validator').Filter
ValidationError = require('./validationError')

restifyValidator = (req, res, next) ->

  req._validationErrors = []

  req.check = (values, name, failMessage) ->
    validator = new Validator()
    value = values?[name]

    validator.error = (message) ->
      error = {
        name: name
        value: value
        message: message
      }

      req._validationErrors.push(error)

      req.onValidatonError?(error)

    return validator.check(value, failMessage)

  req.getValidationErrors = () ->
    return req._validationErrors

  req.getValidationErrorResponse = () ->
    errors = req.getValidationErrors()
    return if errors then new ValidationError(errors) else null

  return next()

module.exports = restifyValidator
