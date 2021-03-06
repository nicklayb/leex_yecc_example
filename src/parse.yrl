Nonterminals
value object pair pairs array list.

Terminals
int float string bool null open_curly close_curly comma colon open_array close_array.

Rootsymbol value.

value -> object : '$1'.
value -> array : '$1'.
value -> int : unwrap('$1').
value -> float : unwrap('$1').
value -> string : unwrap('$1').
value -> bool : unwrap('$1').
value -> null : unwrap('$1').

object -> open_curly pairs close_curly : '$2'.
object -> open_curly close_curly : #{}.

pairs -> pair comma pairs : put_tuple('$1', '$3').
pairs -> pair : put_tuple('$1').
pair -> string colon value : {unwrap('$1'), '$3'}.

array -> open_array list close_array : '$2'.
array -> open_array close_array : [].

list -> value comma list : ['$1' | '$3'].
list -> value : ['$1'].

Erlang code.
unwrap({_, _, V}) -> V.
put_tuple({Key, Value}) -> maps:put(Key,Value, #{}).
put_tuple({Key, Value}, Other) -> maps:merge(maps:put(Key,Value, #{}), Other).
