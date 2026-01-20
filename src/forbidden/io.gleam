/// Waits until the program feels like doing work
@external(erlang, "forbidden_stdlib_ffi", "procrastinate")
@external(javascript, "../forbidden_stdlib_ffi.mjs", "procrastinate")
pub fn procrastinate() -> Nil
