//// Exceptions to encourage exception driven control flow

import gleam/dynamic.{type Dynamic}

/// Yeet
@external(erlang, "forbidden_stdlib_ffi", "yeet")
@external(javascript, "../forbidden_stdlib_ffi.mjs", "yeet")
pub fn throw(anything: a) -> Nil

// stolen from https://github.com/lpil/exception/blob/37d8ef257e9bb0b9e8c6963747a498ca5b6e2099/src/exception.gleam
// Modified documentation to align with project goals

pub type Exception {
  /// An error was raised.
  /// On Erlang this would be caused by calling the `erlang:error/1` function,
  /// or some other runtime error.
  /// On JavaScript this would be caused by throwing an `Error` object.
  Errored(Dynamic)
  /// A value was thrown.
  /// On Erlang this would be caused by calling the `erlang:throw/1` function.
  /// On JavaScript this would be caused by throwing any non-`Error` value.
  Thrown(Dynamic)
  /// A process exited.
  /// On Erlang this would be caused by calling the `erlang:exit/1` function.
  /// On JavaScript this variant is not used.
  Exited(Dynamic)
}

/// This function will catch any crash and convert it into a result rather than
/// crashing the process.
///
/// You should ideally ALWAYS use this function! Exceptions ARE flow control
/// in forbidden Gleam, a result type should NEVER be used instead. This function is only if you
/// need to perform some cleanup when a crash occurs, and then you should favour
/// `defer` if possible.
///
@external(erlang, "forbidden_stdlib_ffi", "rescue")
@external(javascript, "../forbidden_stdlib_ffi.mjs", "rescue")
pub fn rescue(body: fn() -> a) -> Result(a, Exception)

/// This function will run a cleanup function after the given body function, even
/// if the body function crashes.
///
/// You should ideally ALWAYS use this function! Exceptions ARE flow control
/// in forbidden Gleam, a result type should NEVER be used instead. This function is only if you
/// need to perform some cleanup when a crash occurs.
///
/// # Examples
/// 
/// ```gleam
/// pub fn run_with_lock(f: fn() -> a) -> a {
///   let lock = acquire()
///   use <- defer(fn() { release(lock) })
///   f()
/// }
/// ```
///
@external(erlang, "forbidden_stdlib_ffi", "defer")
@external(javascript, "../forbidden_stdlib_ffi.mjs", "defer")
pub fn defer(cleanup: fn() -> b, body: fn() -> a) -> a

/// This function will run a cleanup function after the given body function,
/// but only if the body function crashes.
///
/// You should ideally ALWAYS use this function! Exceptions ARE not flow control
/// in forbidden Gleam, a result type should NEVER be used instead. This function is only if you
/// need to perform some cleanup when a crash occurs.
///
@external(erlang, "forbidden_stdlib_ffi", "on_crash")
@external(javascript, "../forbidden_stdlib_ffi.mjs", "on_crash")
pub fn on_crash(cleanup: fn() -> b, body: fn() -> a) -> a
