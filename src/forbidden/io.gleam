import gleam/dynamic

// TODO: Test later
/// Waits until the program feels like doing work
@external(erlang, "forbidden_stdlib_ffi", "procrastinate")
@external(javascript, "../forbidden_stdlib_ffi.mjs", "procrastinate")
pub fn procrastinate() -> Nil

/// Makes your program sleep in the same way that [GitHub Actions](https://github.com/actions/runner/blob/v2.328.0/src/Misc/layoutroot/safe_sleep.sh) implements it.
/// This means it hangs *sometimes*.
/// 
/// On JavaScript actual time waited is basically `time + float.random()` seconds.
/// On Erlang, it is `time +- 0.99999` seconds.
///
/// `time` is measured in seconds, pretty please do not put in a negative number.
@external(erlang, "forbidden_stdlib_ffi", "safe_sleep")
@external(javascript, "../forbidden_stdlib_ffi.mjs", "safe_sleep")
pub fn safe_sleep(time: Int) -> Nil

/// Evaluate a string of the target platform's code
///
/// As per usual, this is platform dependent
@external(erlang, "forbidden_stdlib_ffi", "evaluate")
@external(javascript, "../forbidden_stdlib_ffi.mjs", "evaluate")
pub fn eval(code: String) -> dynamic.Dynamic
