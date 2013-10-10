restify-validator2
==================

restify-validator2 is middleware for [restify] that integrates with the [node-validator] module.

restify-validator2 borrows some ideas from [restify-validator], but differs in how it specifies where to find the data
to be verified. The original restify-validator's `req.check` method always looks for values in `req.params`,
restify-validator2 allows you to specify an object to pull that value from (i.e. `req.body`, `req.params`, etc.).

[restify]: https://github.com/mcavage/node-restify
[node-validator]: https://github.com/chriso/node-validator
[restify-validator]: https://github.com/cjroebuck/restify-validator
