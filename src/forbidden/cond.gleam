import forbidden/null

pub fn ifthen(cond: boolish, body: fn() -> a) -> a {
  case is_truthy(cond) {
    True -> body()
    False -> null.new()
  }
}

pub fn ifelse(cond: boolish, body: fn() -> any, else_: fn() -> any) {
  case is_truthy(cond) {
    True -> body()
    False -> else_()
  }
}

/// Platform dependent behavior of course
@external(erlang, "forbidden_stdlib_ffi", "is_truthy")
@external(javascript, "../forbidden_stdlib_ffi.mjs", "is_truthy")
pub fn is_truthy(cond: boolish) -> Bool
