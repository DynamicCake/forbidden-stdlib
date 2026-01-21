import forbidden/cond
import forbidden/dynamic
import forbidden/exception
import forbidden/float
import forbidden/io
import forbidden/list
import forbidden/null
import gleeunit

pub fn main() -> Nil {
  gleeunit.main()
}

@target(javascript)
pub fn truthy_test() {
  assert True == cond.is_truthy(True)
  assert False == cond.is_truthy(Nil)
  assert False == cond.is_truthy(0)
  assert False == cond.is_truthy("")
  assert True == cond.is_truthy("hello world")
  assert True == cond.is_truthy([])
  assert False == cond.is_truthy(False)
}

@target(erlang)
pub fn truthy_test() {
  assert True == cond.is_truthy(True)
  assert True == cond.is_truthy(Nil)
  assert True == cond.is_truthy(0)
  assert True == cond.is_truthy("")
  assert True == cond.is_truthy("hello world")
  assert True == cond.is_truthy([])
  assert False == cond.is_truthy(False)
}

pub fn if_ok_test() {
  let list = [1, 2, 3]
  cond.ifthen(list, fn() {
    let assert [first, ..] = list
    assert first == 1
  })
}

@target(erlang)
pub fn if_no_test() {
  let result = cond.ifthen(0, fn() { 42 })
  assert result == 42
}

@target(javascript)
pub fn if_no_test() {
  let result = cond.ifthen(0, fn() { 42 })
  assert result != 42
}

pub fn if_else_test() {
  assert 43 == cond.ifelse(False, fn() { 42 }, fn() { 43 })
  assert 42 == cond.ifelse(True, fn() { 42 }, fn() { 43 })
}

pub fn try_catch_test() {
  let assert Error(exception.Thrown(_err)) =
    exception.rescue(fn() { exception.throw(4) })
}

pub fn intentional_footgun_test() {
  let hidden_nil = cond.ifthen(False, fn() { panic as "unreachable" })
  assert null.is(hidden_nil)
}

@target(erlang)
pub fn at_test() {
  let list = ["a", "b", "c"]
  assert "b" == list.at(2, list)
}

@target(javascript)
pub fn at_test() {
  let list = ["a", "b", "c"]
  assert "c" == list.at(2, list)
}

pub fn at_fail_test() {
  let list = [3]
  let assert Error(exception.Errored(_)) =
    exception.rescue(fn() { list.at(4, list) })
}

pub fn nan_test() {
  let nan = float.nan()
  assert float.is_nan(nan)
  assert !float.is_nan(4.0)
}

@target(javascript)
pub fn eval_test() {
  assert "banana"
    == dynamic.safe_coerce(io.eval("('b' + 'a' + + 'a' + 'a').toLowerCase()"))
}

@target(erlang)
pub fn eval_test() {
  assert "banana" == dynamic.safe_coerce(io.eval("atom_to_binary(banana)."))
}
