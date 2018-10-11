// Generated by BUCKLESCRIPT VERSION 4.0.6, PLEASE EDIT WITH CARE
'use strict';

var Cors = require("cors");
var Express = require("express");
var Js_null_undefined = require("bs-platform/lib/js/js_null_undefined.js");

function init($staropt$star, _) {
  var useCors = $staropt$star !== undefined ? $staropt$star : true;
  var app = Express();
  if (useCors) {
    app.use(Cors());
  }
  return app;
}

function writeHead(resp, headers, code) {
  resp.writeHead(code, Js_null_undefined.fromOption(headers));
  return /* () */0;
}

function body(prim) {
  return prim.body;
}

function headers(prim) {
  return prim.headers;
}

function params(prim) {
  return prim.params;
}

function query(prim) {
  return prim.query;
}

function originalUrl(prim) {
  return prim.originalUrl;
}

function end_(prim) {
  prim.end();
  return /* () */0;
}

function json(prim, prim$1) {
  prim.json(prim$1);
  return /* () */0;
}

function $$location(prim, prim$1) {
  return prim.location(prim$1);
}

function pipe(prim, prim$1) {
  prim.pipe(prim$1);
  return /* () */0;
}

function send(prim, prim$1) {
  return prim.send(prim$1);
}

function status(prim, prim$1) {
  return prim.status(prim$1);
}

function listen(prim, prim$1) {
  prim.listen(prim$1);
  return /* () */0;
}

function use(prim, prim$1) {
  prim.use(prim$1);
  return /* () */0;
}

function get(prim, prim$1, prim$2) {
  prim.get(prim$1, prim$2);
  return /* () */0;
}

function post(prim, prim$1, prim$2) {
  prim.post(prim$1, prim$2);
  return /* () */0;
}

function put(prim, prim$1, prim$2) {
  prim.put(prim$1, prim$2);
  return /* () */0;
}

function Router_000(prim, prim$1, prim$2) {
  prim.get(prim$1, prim$2);
  return /* () */0;
}

function Router_001(prim, prim$1, prim$2) {
  prim.post(prim$1, prim$2);
  return /* () */0;
}

function Router_002(prim, prim$1, prim$2) {
  prim.put(prim$1, prim$2);
  return /* () */0;
}

function Router_003(prim) {
  return prim.Router();
}

var Router = [
  Router_000,
  Router_001,
  Router_002,
  Router_003
];

exports.body = body;
exports.headers = headers;
exports.params = params;
exports.query = query;
exports.originalUrl = originalUrl;
exports.end_ = end_;
exports.json = json;
exports.$$location = $$location;
exports.pipe = pipe;
exports.send = send;
exports.status = status;
exports.writeHead = writeHead;
exports.init = init;
exports.listen = listen;
exports.use = use;
exports.get = get;
exports.post = post;
exports.put = put;
exports.Router = Router;
/* cors Not a pure module */
