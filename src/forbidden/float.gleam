/// Creates a nan
/// In erlang, probably has strange behavior ¯\_(ツ)_/¯
@external(erlang, "forbidden_stdlib_ffi", "nan")
@external(javascript, "../forbidden_stdlib_ffi.mjs", "nan")
pub fn nan() -> Float

@external(erlang, "forbidden_stdlib_ffi", "is_nan")
@external(javascript, "../forbidden_stdlib_ffi.mjs", "is_nan")
pub fn is_nan(n: Float) -> Bool
