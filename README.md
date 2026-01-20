# Forbidden Stdlib
An unspeakable evil sealed away from Gleam. Will you break the seal and unleash the evil onto your codebase?

I have made the choice NOT to publish this to `hex.pm` because it would be a net negative to the repo.
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

pub fn main() -> Nil {
  let list = [7, 8, 9]
  assert list.at(2, list) == 8
}
```

More docs can be found by running `gleam docs build` and opening the html file with a browser of your choice.

## Development

```sh
gleam test  # Run the tests
```

