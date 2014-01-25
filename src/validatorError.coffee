RestError = (require 'restify').RestError

class ValidatorError extends RestError
    constructor: (errors) ->
        super
            restCode: 'ValidatorError'
            statusCode: 400
            body:
              code: 'ValidatorError'
              errors: errors
            constructorOpt: ValidatorError

        @name = 'ValidatorError'


module.exports = ValidatorError
