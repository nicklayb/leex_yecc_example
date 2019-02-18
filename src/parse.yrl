Nonterminals
value object pair pairs array list.

Terminals
int float string bool null open_curly close_curly comma colon open_array close_array.

Rootsymbol value.

value -> object : '$1'.
value -> array : '$1'.
value -> int : '$1'.
value -> float : '$1'.
value -> string : '$1'.
value -> bool : '$1'.
value -> null : '$1'.

object -> open_curly pairs close_curly : {object, '$2'}.
object -> open_curly close_curly : {object, []}.

pairs -> pair comma pairs : ['$1' | '$3'].
pairs -> pair : ['$1'].
pair -> string colon value : {'$1', '$3'}.

array -> open_array list close_array : {array, '$2'}.
array -> open_array close_array : {array, []}.

list -> value comma list : ['$1' | '$3'].
list -> value : ['$1'].

Erlang code.
unwrap({_, _, V}) -> V.
