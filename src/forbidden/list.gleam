import gleam/list

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
