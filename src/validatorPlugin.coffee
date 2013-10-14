Validator = require('validator').Validator
ValidatorError = require('./validatorError')

module.exports = (req, res, next) ->
  req._validatorErrors = []

  req.check = (values, name, failMessage) ->
    validator = new Validator()
    value = values?[name]

    validator.error = (message) ->
      error = {
        name: name
        value: value
        message: message
      }

      req._validatorErrors.push(error)

    return validator.check(value, failMessage)

  req.getValidatorErrors = () ->
    return req._validatorErrors

  req.getValidatorErrorResponse = () ->
    errors = req.getValidatorErrors()
    return if errors?.length then new ValidatorError(errors) else null

  return next()
