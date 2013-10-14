restify-validator2
==================

restify-validator2 is middleware for [restify] that integrates with the [node-validator] module.

restify-validator2 borrows some ideas from [restify-validator], but differs in how it specifies where to find the data
to be verified. The original restify-validator's `req.check` method always looks for values in `req.params`,
restify-validator2 allows you to specify an object to pull that value from (i.e. `req.body`, `req.params`, etc.).

Installation
============

```
npm install restify-validator2
```

Usage
=====

```JavaScript
var restify = require('restify');
var restifyValidator = require('restify-validator2');
var app = restify.createServer();

app.use(restify.bodyParser({ mapParams: false }));
app.use(restify.queryParser({ mapParams: false }));
app.use(restifyValidator.validatorPlugin);

app.post('/:urlparam', function(req, res) {
  // Make sure `urlparam` exists in parameters parsed from the route
  req.check(req.params, 'urlparam').notEmpty();

  // Make sure `queryparam` exists in parameters parsed from the query string
  req.check(req.query, 'queryparam').notEmpty();

  // Make sure `bodyparam` exists in parameters parsed from the request body
  req.check(req.body, 'bodyparam').notEmpty();

  var validatorErrorResponse = req.getValidatorErrorResponse();
  if (validatorErrorResponse) {
    res.send(validatorErrorResponse)
    return next()
  }

  res.json({
    urlparam: req.params['urlparam'],
    queryparam: req.query['queryparam'],
    bodyparam: req.body['bodyparam']
  });
});

app.listen(8888);
```

[restify]: https://github.com/mcavage/node-restify
[node-validator]: https://github.com/chriso/node-validator
[restify-validator]: https://github.com/cjroebuck/restify-validator
