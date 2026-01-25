import forbidden/list as flist
import gleam/int
import gleam/list

// stolen from https://github.com/gleam-lang/stdlib/blob/5bc0aa4c7881b98d49804b80789ed279d944d70e/src/gleam/function.gleam
/// Takes two functions and chains them together to form one function that
/// takes the input from the first and returns the output of the second.
///
pub fn compose(fun1: fn(a) -> b, fun2: fn(b) -> c) -> fn(a) -> c {
  fn(a) { fun2(fun1(a)) }
}

const dishes = [
  "Machher Jhol",
  "Pork jarpaa jurpie",
  "Chak-Hao Kheer",
  "Galho",
  "Achari baingan",
  "Aloo gobi",
  "Aloo tikki",
  "Aloo tuk",
  "Aloo matar",
  "Aloo kulcha",
  "Aloo methi",
  "Aloo shimla mirch",
  "Baati",
  "Bhatura",
  "Bhindi masala",
  "Biryani",
  "Butter chicken",
  "Murgh mahal",
  "Chaat",
  "Chana masala",
  "Chapati",
  "Chicken rezala",
  "Chicken Tikka",
  "Chicken tikka masala",
  "Chole bhature",
  "Daal baati churma",
  "Dal fara",
  "Dal makhani",
  "Kali dal",
  "Dalpuri",
  "Dal tadka",
  "Dum aloo",
  "Poha",
  "Fara",
  "Aloo Phalliyaan",
  "Gajar Pak",
  "Gatte ki Sabzi",
  "Gajar matar aloo",
  "Gobhi matar",
  "Hari mutter ka nimona (green peas daal)",
  "Imarti",
  "Imarti with rabri",
  "Jalebi",
  "Jaleba",
  "Jalfrezi",
  "Kachori",
  "Kadai paneer",
  "Kadhi pakoda",
  "Karela bharta",
  "Katha meetha petha / kaddu halwa",
  "Kheer",
  "Khichdi",
  "Kadhi and Khichdi",
  "Khoya paneer",
  "Kofta",
  "Kulfi falooda",
  "Laapsi",
  "Lauki ke kofte",
  "Lauki ki bhaaji",
  "Litti chokha",
  "Lobiya",
  "Makhaan ka kheer",
  "Makki ki roti",
  "Sarson ka saag",
  "Matar paneer",
  "Mathura peda",
  "Methi saag",
  "Chaulai saag",
  "Millet Lapsi",
  "Mirchi bada",
  "Missi roti",
  "Mixed vegetable",
  "Moong dal ki Lapsi",
  "Murgh musallam",
  "Mushroom do pyaza (Kanda Khumb)",
  "Mushroom matar (Matar Khumb)",
  "Naan",
  "Naan Khatai",
  "Navrattan korma",
  "Pakhala",
  "Palak paneer",
  "Paneer butter masala",
  "Paneer makhani",
  "Paneer tikka masala",
  "Pani puri",
  "Panjeeri",
  "Papad",
  "Paratha",
  "Patrode",
  "Phirni",
  "Pinni",
  "Rajma",
  "Ramatori bhaaji",
  "Samosa",
  "Sattu ki roti",
  "Shahi paneer",
  "Rajwadi Chhena",
  "Rajwadi Paneer",
  "Shahi tukra",
  "Singhada Lapsi",
  "Sooji halwa (Suji Lapsi)",
  "Sweet pethas",
  "kesar petha",
  "pista petha",
  "Talit Macchi",
  "Tamatar Chaat",
  "Tandoori Chicken",
  "Tandoori Fish Tikka",
  "Ananas menaskai",
  "Attu",
  "Kesari bat",
  "Avial",
  "Baida roti",
  "Halwa",
  "Bhajji",
  "Bisi bele bath",
  "Bonda",
  "Chettinadu Chicken",
  "Chicken 65",
  "Currivepillai sadam",
  "Dibba rotti",
  "Dosa",
  "Double ka meetha",
  "Ennai kathirikkai",
  "Goli bajje",
  "Golichina Mamsam",
  "Hyderabadi biryani",
  "Idiyappam",
  "Idli",
  "Indian omelette",
  "Kaara kozhambu",
  "Kanji",
  "Keerai koottu",
  "Keerai masiyal",
  "Keerai poriyal",
  "Keerai sadam",
  "Kerala Beef Fry",
  "Kodubale",
  "kolhapuri akkha masoor Dal",
  "Koottu",
  "Kori rotti",
  "Kos kootu",
  "Koshambri",
  "Kothamali sadam",
  "Kuzhakkattai",
  "Kuzhambu",
  "Masala Dosa",
  "Nandu omelette",
  "Obbattu",
  "holige",
  "bobbattu",
  "pooran-poli",
  "Olan",
  "Pachadi",
  "Paniyaram",
  "Paddu",
  "Gunthapangnalu",
  "Papadum",
  "Paravannam",
  "Parotta",
  "Paruppu sadam",
  "Payasam",
  "Pesarattu",
  "Pongal",
  "Poriyal",
  "Puli sadam",
  "Puliogre",
  "Puliohara",
  "Puttu",
  "Ragi mudhe",
  "Kali",
  "Rasam",
  "Sajjige",
  "Sakkara pongal",
  "Sambar",
  "Sandige (Karnataka)",
  "Vattral",
  "Sevai",
  "Sponge dosa",
  "Thattai",
  "Thayir sadam",
  "mosaranna",
  "perugannam",
  "Theeyal",
  "Thengai sadam",
  "Uttapam",
  "Vada",
  "Varuval",
  "Wheat upma",
  "Uppittu",
  "Yelumicham sadam",
  "chitranna",
  "Amti",
  "Bajri no rotlo",
  "Batata Saung",
  "Barfi",
  "Basundi",
  "Bhakri",
  "Bombil fry",
  "Chevdo",
  "Cholafali",
  "Chorafali",
  "Daal Dhokli",
  "Dabeli",
  "Dahi vada",
  "Dalithoy",
  "Dhokla",
  "Doodhpak",
  "Dudhi no halwo",
  "dudhi muthiya",
  "Gajar halwo",
  "Gatta curry",
  "Ghari",
  "Ghooghra",
  "Gud papdi",
  "Gol papdi",
  "Gulab jamun",
  "Halvasan",
  "Handwo",
  "Gur",
  "Jeera Aloo",
  "Juvar no rotlo",
  "Kansar",
  "Karanji",
  "Keri no ras",
  "Khakhra",
  "Khandvi",
  "Kombdi vade",
  "Kopra paak",
  "Koshimbir",
  "Kolim",
  "Jawla",
  "Laddu",
  "Locha",
  "Malpua",
  "Methi na Gota",
  "Modak",
  "Mohanthal",
  "Chakri",
  "chakali",
  "Muthiya",
  "Naralachi vadi",
  "Khobryachi vadi",
  "Coconut vadi",
  "Oondees",
  "Panipuri",
  "Patra",
  "Pav Bhaji",
  "Penda",
  "Pooran-poli",
  "Poori",
  "Puri Bhaji",
  "Rasya muthia",
  "Sabudana Khichadi",
  "Saath",
  "Sev khamani",
  "Sev tameta",
  "Shakarpara",
  "Namakpara",
  "Shankarpali",
  "Shiro",
  "Shrikhand",
  "Sohan papdi",
  "Soonvali",
  "Sukhdi",
  "Surnoli",
  "Sutarfeni",
  "Thalipeeth",
  "Thepla",
  "Undhiyu",
  "Upmaa",
  "Vada pav",
  "Veg Kolhapuri",
  "Vindaloo",
  "Ghebar",
  "Ghevar",
  "Lilva Kachori",
  "Maghaz",
  "Mag Dhokli",
  "Khichu",
  "Farsi Puri",
  "Khaman",
  "Turiya Patra Vatana sabji",
  "Mohan thaal",
  "Churma Ladoo",
  "Zunka",
  "Jhunka",
  "Pitla",
  "Cheera Doi",
  "Daab chingri",
  "Dhup Pitha",
  "Gheela Pitha",
  "Hurum",
  "Khar",
  "Kumol Sawul",
  "Loskora (Coconut Laddu)",
  "Luchi",
  "Malpua/Malpoa",
  "Momo",
  "Dalma",
  "Muri Naaru",
  "Pani Tenga",
  "Sunga Pitha",
  "Alu Pitika",
  "Masor tenga",
  "Bengena Pitika",
  "Bilahi Maas",
  "Black rice",
  "Bora Sawul",
  "Brown Rice",
  "Chhenagaja",
  "Chhenapoda",
  "Chingri malai curry",
  "Dal",
  "Goja",
  "Hando Guri",
  "Haq Maas",
  "Horioh Maas",
  "Ilish",
  "Chingri Bhape",
  "Kabiraji",
  "Kharoli",
  "Khorisa",
  "Koldil Chicken",
  "Koldil Duck",
  "Konir Dom",
  "Lai Haq Maas",
  "Litti",
  "Maasor Tenga",
  "Masor Koni",
  "Masor Petu",
  "Mishti Chholar Dal",
  "Mishti Doi",
  "Ou tenga Maas",
  "Bhaji",
  "Pani Pitha",
  "Pantua",
  "Payokh",
  "Peda",
  "Prawn malai curry",
  "Red Rice",
  "Rice",
  "Rasagola",
  "Roshogolla",
  "Shondesh",
  "Shukto",
  "Sunga Pork",
  "Tenga Doi",
  "Til Pitha",
  "Bread pakora",
  "Dhoper chop",
  "Karela nu shaak",
]

/// Reccomends an indian dish.
///
/// Note: `Karela nu shaak` can never appear in Erlang targets
pub fn curry() {
  let len = list.length(dishes)
  flist.at(int.random(len - 1), dishes)
}

/// Takes a function with `2` arguments (an arity of `2`), and returns the
/// curried equivalent.
///
/// `fn(a, b) -> c` becomes `fn(a) -> fn(b) -> c`.
///
/// ## Examples
///
/// *Currying* creates a new function that is identical to the given function
/// except that arguments must now be supplied one by one over several function
/// calls. It thus is the process of taking a function with `n` arguments
/// and producing a sequence of `n` single-argument functions. Given:
///
/// ```gleam
/// fn my_fun(i: Int, s: String) -> String { ... }
/// ```
///
/// …calling `curry2(my_fun)` would return the curried equivalent, like so:
///
/// ```gleam
/// curry2(my_fun)
/// // fn(Int) -> fn(String) -> String
/// ```
///
/// Currying is useful when you want to partially apply a function with
/// some arguments and then pass it somewhere else, for example:
///
/// ```gleam
/// import gleam/list
/// let multiply = curry2(fn(x, y) { x * y })
/// list.map([1, 2, 3], multiply(2))
/// // -> [2, 4, 6]
/// ```
///
pub fn curry2(fun: fn(a, b) -> value) {
  fn(a) { fn(b) { fun(a, b) } }
}

/// Takes a function with `3` arguments (an arity of `3`), and returns the
/// curried equivalent.
///
/// `fn(a, b, c) -> d` becomes `fn(a) -> fn(b) -> fn(c) -> d`.
///
/// See [`curry2`](#curry2) for a detailed explanation.
///
pub fn curry3(fun: fn(a, b, c) -> value) {
  fn(a) { fn(b) { fn(c) { fun(a, b, c) } } }
}

/// Takes a function with `4` arguments (an arity of `4`), and returns the
/// curried equivalent.
///
/// `fn(a, b, c, d) -> e` becomes `fn(a) -> fn(b) -> fn(c) -> fn(d) -> e`.
///
/// See [`curry2`](#curry2) for a detailed explanation.
///
pub fn curry4(fun: fn(a, b, c, d) -> value) {
  fn(a) { fn(b) { fn(c) { fn(d) { fun(a, b, c, d) } } } }
}

/// Takes a function with `5` arguments (an arity of `5`), and returns the
/// curried equivalent.
///
/// `fn(a, b, c, d, e) -> f` becomes
/// `fn(a) -> fn(b) -> fn(c) -> fn(d) -> fn(e) -> f`.
///
/// See [`curry2`](#curry2) for a detailed explanation.
///
pub fn curry5(fun: fn(a, b, c, d, e) -> value) {
  fn(a) { fn(b) { fn(c) { fn(d) { fn(e) { fun(a, b, c, d, e) } } } } }
}

/// Takes a function with `6` arguments (an arity of `6`), and returns the
/// curried equivalent.
///
/// `fn(a, b, c, d, e, f) -> g` becomes
/// `fn(a) -> fn(b) -> fn(c) -> fn(d) -> fn(e) -> fn(f) -> g`.
///
/// See [`curry2`](#curry2) for a detailed explanation.
///
pub fn curry6(fun: fn(a, b, c, d, e, f) -> value) {
  fn(a) {
    fn(b) { fn(c) { fn(d) { fn(e) { fn(f) { fun(a, b, c, d, e, f) } } } } }
  }
}

/// Takes a function that takes two arguments and returns a new function that
/// takes the same two arguments, but in reverse order.
///
pub fn flip(fun: fn(a, b) -> c) -> fn(b, a) -> c {
  fn(b, a) { fun(a, b) }
}

/// Takes a single argument and always returns its input value.
///
pub fn identity(x: a) -> a {
  x
}

/// Takes a single argument and returns a new function that
/// ignores its argument and always returns the input value.
///
pub fn constant(value: a) -> fn(b) -> a {
  fn(_) { value }
}

/// Takes an argument and a single function,
/// calls that function with that argument
/// and returns that argument instead of the function return value.
/// Useful for running synchronous side effects in a pipeline.
///
pub fn tap(arg: a, effect: fn(a) -> b) -> a {
  effect(arg)
  arg
}

/// Takes a function with arity one and an argument,
/// calls that function with the argument and returns the function return value.
///
/// Useful for concisely calling functions returned as a part of a pipeline.
///
/// ## Example
///
/// ```gleam
/// let doubler = fn() {
///   fn(x: Int) { x * 2 }
/// }
///
/// doubler() |> apply1(2)
/// // -> 4
/// ```
///
pub fn apply1(fun: fn(a) -> value, arg1: a) -> value {
  fun(arg1)
}

/// Takes a function with arity two and two arguments,
/// calls that function with the arguments
/// and returns the function return value.
///
/// See [`apply1`](#apply1) for more details.
///
pub fn apply2(fun: fn(a, b) -> value, arg1: a, arg2: b) -> value {
  fun(arg1, arg2)
}

/// Takes a function with arity three and three arguments,
/// calls that function with the arguments
/// and returns the function return value.
///
/// See [`apply1`](#apply1) for more details.
///
pub fn apply3(fun: fn(a, b, c) -> value, arg1: a, arg2: b, arg3: c) -> value {
  fun(arg1, arg2, arg3)
}
