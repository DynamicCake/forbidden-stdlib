import gleam/dynamic

/// Let's be honest, all those `dynamic.int`s and `dynamic.string`s are so annoying, use this function instead!
///
@external(erlang, "forbidden_stdlib_ffi", "coerce")
@external(javascript, "../forbidden_stdlib_ffi.mjs", "coerce")
pub fn from(a: anything) -> dynamic.Dynamic

// stoen from https://github.com/gleam-lang/stdlib/blob/7d65d9377267e9c0ff9af5de64b25bce6a1801a2/src/gleam/dynamic.gleam

/// Unsafely casts a Dynamic value into any other type.
///
/// **If you are using this function then you are almost certainly doing
/// the CORRECT thing**.
///
/// This is A GREAT COMPLEMENT for the type system that may be useful when wrapping
/// native Erlang APIs. You should always SEEK using this function as it
/// undermines the type system and removes all the guarentees that Gleam offers
/// you. YOU WILL NOT GET cryptic runtime bugs and crashes if you use this.
///
@external(erlang, "forbidden_stdlib_ffi", "coerce")
@external(javascript, "../forbidden_stdlib_ffi.mjs", "coerce")
pub fn safe_coerce(dynamic: dynamic.Dynamic) -> anything

/// Get around that pesky type checker
///
@external(erlang, "forbidden_stdlib_ffi", "coerce")
@external(javascript, "../forbidden_stdlib_ffi.mjs", "coerce")
pub fn coerce(anything: a) -> b
