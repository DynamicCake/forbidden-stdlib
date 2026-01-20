/// Creates a nan
///
/// In erlang, probably has strange behavior idk ¯\\_(ツ)_/¯ 
@external(erlang, "forbidden_stdlib_ffi", "nan")
@external(javascript, "../forbidden_stdlib_ffi.mjs", "nan")
pub fn nan() -> Float

/// Returns true if float is nan
@external(erlang, "forbidden_stdlib_ffi", "is_nan")
@external(javascript, "../forbidden_stdlib_ffi.mjs", "is_nan")
pub fn is_nan(n: Float) -> Bool
