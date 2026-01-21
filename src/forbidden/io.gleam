import gleam/dynamic

// TODO: Test later
/// Waits until the program feels like doing work
@external(erlang, "forbidden_stdlib_ffi", "procrastinate")
@external(javascript, "../forbidden_stdlib_ffi.mjs", "procrastinate")
pub fn procrastinate() -> Nil

/// Makes your program sleep for a certain duration in milliseconds
///
/// On JavaScript, since it is single threaded, instead of sleeping,
/// it does useless computation for the provided time in milliseconds
@external(erlang, "timer", "sleep")
@external(javascript, "../forbidden_stdlib_ffi.mjs", "labor")
pub fn sleep(time_ms: Int) -> Nil

/// Evaluate a string
/// As per usual, this is platform dependent
@external(erlang, "forbidden_stdlib_ffi", "evaluate")
@external(javascript, "../forbidden_stdlib_ffi.mjs", "evaluate")
pub fn eval(code: String) -> dynamic.Dynamic
