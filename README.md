# Forbidden Stdlib
An unspeakable evil sealed away from Gleam. Will you break the seal and unleash the evil onto your codebase?

> I have made the choice NOT to publish this to `hex.pm` because it would be a net negative to the repo.
Do NOT publish this package to `hex.pm`.

## Installation
1. Swear an oath to NEVER unleash this evil to production
2. Add this as a git dependency to your `gleam.toml`
```toml
[dependencies]
forbidden_stdlib = { git = "https://github.com/DynamicCake/forbidden-stdlib", ref = "main" }
```

## Usage
```gleam
import forbidden/list

// Platform dependent behavior for free!
@target(erlang)
pub fn main() -> Nil {
  let list = [7, 8, 9]
  assert list.at(2, list) == 8
}
@target(javascript)
pub fn main() -> Nil {
  let list = [7, 8, 9]
  assert list.at(2, list) == 9
}
```

More docs can be found at [https://dyncake.dev/forbidden](https://dyncake.dev/forbidden) this link has a guaranteed lifespan of only 1 month.
Once this link dies, clone this repo and run `gleam docs build` to view docs.

## Development

```sh
gleam test  # Run the tests
```

