Definitions.

Whitespace = [\s\t]
Terminator = \n|\r\n|\r
Comma = ,

Digit = [0-9]
NonZeroDigit = [1-9]
NegativeSign = [\-]
FractionalPart = \.{Digit}+
OpenArray = \[
CloseArray = \]
OpenCurly = \{
CloseCurly = \}
Colon = :
String = "([^\"\\]|\\.)*"
True = true
False = false
Null = null

IntegerPart = {NegativeSign}?0|{NegativeSign}?{NonZeroDigit}{Digit}*
IntValue    = {IntegerPart}
FloatValue  = {IntegerPart}{FractionalPart}|{IntegerPart}{ExponentPart}|{IntegerPart}{FractionalPart}{ExponentPart}

Rules.

{Whitespace}  : skip_token.
{Terminator}  : skip_token.
{Comma}       : {token, {comma, TokenLine, list_to_atom(TokenChars)}}.
{IntValue}    : {token, {int, TokenLine, list_to_integer(TokenChars)}}.
{FloatValue}  : {token, {float, TokenLine, list_to_float(TokenChars)}}.
{String}      : {token, {string, TokenLine, string:trim(TokenChars, both, "\"")}}.
{True}        : {token, {bool, TokenLine, true}}.
{False}       : {token, {bool, TokenLine, false}}.
{Null}        : {token, {null, TokenLine, nil}}.
{OpenCurly}   : {token, {open_curly, TokenLine, list_to_atom(TokenChars)}}.
{CloseCurly}  : {token, {close_curly, TokenLine, list_to_atom(TokenChars)}}.
{OpenArray}   : {token, {open_array, TokenLine, list_to_atom(TokenChars)}}.
{CloseArray}  : {token, {close_array, TokenLine, list_to_atom(TokenChars)}}.
{Colon}       : {token, {colon, TokenLine, list_to_atom(TokenChars)}}.

Erlang code.
