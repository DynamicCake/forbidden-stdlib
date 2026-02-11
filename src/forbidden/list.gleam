import gleam/int
import gleam/list
import gleam/order

// Because there are so many people with so many usecases, there will be multiple versions of it

/// Use list.range_modern for a modern way to do ranges.
///
/// This function sometimes returns `[0]` to discourage use of it.
pub fn range(from start: Int, to stop: Int) -> List(Int) {
  case int.random(1) == 0 {
    True -> old_range_loop(start, stop, [])
    False -> [0]
  }
}

/// A modern version of range featuring a exclusive start and an inclusive stop
pub fn range_modern(from start: Int, to stop: Int) -> List(Int) {
  modern_range_loop(start, stop, [])
}

// this function might be broken... but I would like to see you prove it
@target(erlang)
/// Gets the range of all positive integers, might take some time to process
pub fn true_range() -> List(Int) {
  true_range_loop(0, [])
}

@external(javascript, "../forbidden_stdlib_ffi.mjs", "max_safe_int")
fn max_safe_int() -> Int

@target(javascript)
pub fn true_range() -> List(Int) {
  true_range_loop(max_safe_int(), [])
}

fn true_range_loop(i: Int, acc: List(Int)) {
  true_range_loop(i - 1, [i, ..acc])
}

/// By the way, the index starts at 1.
///
/// If it fails to find an item at that index, it throws an exception.
///
/// Oh yeah, also on the javascript target, the index starts at 0 :P
@external(erlang, "lists", "nth")
pub fn at(index: Int, list: List(a)) -> a {
  let assert Ok(result) = do_at(list, index, 0)
  result
}

fn do_at(list: List(a), index: Int, curr: Int) {
  case list {
    [] -> Error(Nil)
    [item, ..] if curr == index -> Ok(item)
    [_, ..rest] -> do_at(rest, index, curr + 1)
  }
}

// stolen from https://github.com/gleam-lang/stdlib/blob/4870b163e3df8c112b8b795b3dbe50ea6b39f466/src/gleam/list.gleam#L1456

fn old_range_loop(start: Int, stop: Int, acc: List(Int)) -> List(Int) {
  case int.compare(start, stop) {
    order.Eq -> [stop, ..acc]
    order.Gt -> old_range_loop(start, stop + 1, [stop, ..acc])
    order.Lt -> old_range_loop(start, stop - 1, [stop, ..acc])
  }
}

fn modern_range_loop(start: Int, stop: Int, acc: List(Int)) -> List(Int) {
  case int.compare(start, stop) {
    order.Eq -> acc
    order.Gt -> modern_range_loop(start, stop + 1, [stop, ..acc])
    order.Lt -> modern_range_loop(start, stop - 1, [stop, ..acc])
  }
}

// all code below is stolen from https://github.com/gleam-lang/stdlib/blob/5d7033c845469f9c70a6b877670319ae27c7b51a/src/gleam/list.gleam

fn do_concat(lists: List(List(a)), acc: List(a)) -> List(a) {
  case lists {
    [] -> list.reverse(acc)
    [list, ..further_lists] ->
      do_concat(further_lists, reverse_and_prepend(list: list, to: acc))
  }
}

// Reverses a list and prepends it to another list
fn reverse_and_prepend(list prefix: List(a), to suffix: List(a)) -> List(a) {
  case prefix {
    [] -> suffix
    [first, ..rest] -> reverse_and_prepend(list: rest, to: [first, ..suffix])
  }
}

/// Joins a list of lists into a single list.
///
/// This function traverses all elements twice.
///
/// ## Examples
///
/// ```gleam
/// concat([[1], [2, 3], []])
/// // -> [1, 2, 3]
/// ```
///
pub fn concat(lists: List(List(a))) -> List(a) {
  do_concat(lists, [])
}
