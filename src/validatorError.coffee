RestError = (require 'restify').RestError

class ValidatorError extends RestError
    constructor: (error) ->
        super
            restCode: 'ValidatorError'
            statusCode: 400
            body:
              code: 'ValidatorError'
              errors: errors
            constructorOpt: ValidatorError

        @name = 'ValidatorError'


module.exports = ValidatorError
