-module(forbidden_stdlib_ffi).
-export([is_truthy/1, coerce/1, yeet/1, procrastinate/0, nan/0, is_nan/1, rescue/1, defer/2, on_crash/2]).

is_truthy(X) ->
    X /= false.

coerce(X) ->
    X.

yeet(X) ->
    throw(X).

procrastinate() ->
    _Hmm = 1 + 1,
    procrastinate().

nan() ->
    nan.

is_nan(N) ->
    nan == N.

% stolen from https://github.com/lpil/exception/blob/37d8ef257e9bb0b9e8c6963747a498ca5b6e2099/src/exception_ffi.erl
rescue(F) ->
    try {ok, F()}
    catch
      error:Term -> {error, {errored, Term}};
      throw:Term -> {error, {thrown, Term}};
      exit:Term -> {error, {exited, Term}}
    end.

defer(Cleanup, Body) ->
    try Body()
    after Cleanup()
    end.

on_crash(Cleanup, Body) ->
    try Body()
    catch A:B:C ->
        Cleanup(), 
        erlang:raise(A,B,C)
    end.

