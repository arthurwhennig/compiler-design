(* Example of writing a lexer by hand (part 0)
 *
 * The purpose of this file and handlex.ml is mainly to illustrate that
 * it is a bit annoying and tedious to have to write lexers by hand.
 *)

(* Define the datatype of tokens *)
type token =
  | Int    of int64
  | Ident  of string
  | LPAREN
  | RPAREN
  | LBRACK
  | RBRACK
  | SEMICOLON
  | PLUS
  | MINUS
  | EQ
  | EQEQ
  | STAR
  | LPARENSTAR
  | STARRPAREN
  | IF
  | ELSE

let print_token t =
  begin match t with
    | Int x       -> (Printf.printf "Int %Ld\n%!" x)
    | Ident s     -> (Printf.printf "Ident %s\n%!" s)
    | LPAREN      -> (Printf.printf "LPAREN\n%!")
    | RPAREN      -> (Printf.printf "RPAREN\n%!")
    | LBRACK      -> (Printf.printf "LBRACK\n%!")
    | RBRACK      -> (Printf.printf "RBRACK\n%!")
    | SEMICOLON   -> (Printf.printf "SEMICOLON\n%!")
    | PLUS        -> (Printf.printf "PLUS\n%!")
    | MINUS       -> (Printf.printf "MINUS\n%!")
    | EQ          -> (Printf.printf "EQ\n%!")
    | EQEQ        -> (Printf.printf "EQEQ\n%!")
    | STAR        -> (Printf.printf "STAR\n%!")
    | LPARENSTAR  -> (Printf.printf "LPARENSTAR\n%!")
    | STARRPAREN  -> (Printf.printf "STARRPAREN\n%!")
    | IF          -> (Printf.printf "IF\n%!")
    | ELSE        -> (Printf.printf "ELSE\n%!")
  end


(* This exception is raised when an unanticipated character is read *)
exception Lex_error of char

let is_character c =
  (('a' <= c) && (c <= 'z')) || (('A' <= c) && (c <= 'Z'))

let is_digit c =
  ('0' <= c) && (c <= '9')

let is_whitespace c =
  ('\t' = c) || (' ' = c) || ('\n' = c) || ('\r' = c)

let is_underscore c = c = '_'

let is_lparen c = c = '('

let is_rparen c = c = ')'

let is_lbrack c = c = '{'

let is_rbrack c = c = '}'

let is_semicolon c = c = ';'

let is_star c = c = '*'

let is_plus c = c = '+'

let is_minus c = c = '-'

let is_eq c = c = '='

let keywords : (string * token) list =
  [("if", IF); ("else", ELSE)]

(* returns either a keyword from s or an identifier containing s *)
let ident_or_keyword s =
  try
    List.assoc s keywords
  with
    | Not_found -> Ident s

(* creates a token list from an input channel, ignoring whitespace *)
let rec lex (input:in_channel) : token list =
  let acc = ref [] in
  let emit t = acc := t::(!acc) in

  (* Identifies the next token in the input stream given that
   * it starts with character c. *)
  let rec next (c:char) =
    if       is_whitespace c  then next (input_char input)
    else if  is_lparen c      then (lex_lparen_or_comment c)
    else if  is_rparen c      then (emit RPAREN; next (input_char input))
    else if  is_lbrack c      then (emit LBRACK; next (input_char input))
    else if  is_rbrack c      then (emit RBRACK; next (input_char input))
    else if  is_semicolon c   then (emit SEMICOLON; next (input_char input))
    else if  is_character c   then (lex_id_or_keyword c)
    else if  is_digit c       then (lex_int c)
    else if  is_star c        then (lex_star_or_comment c)
    else if  is_star c        then (emit STAR; next (input_char input))
    else if  is_plus c        then (emit PLUS; next (input_char input))
    else if  is_minus c       then (emit MINUS; next (input_char input))
    else if  is_eq c          then (lex_eq_or_eqeq c)
    else raise (Lex_error c)

  and lex_int c =
    let buf = Buffer.create 16 in

    let rec loop () =
      let c = (input_char input) in
	    if (is_digit c) then
        (Buffer.add_char buf c; loop ())
	    else
        (emit (Int (Int64.of_string (Buffer.contents buf))); next c)
    in
      (Buffer.add_char buf c; loop ())

  and lex_id_or_keyword c =
    let buf = Buffer.create 16 in

    let rec loop () =
      let c = (input_char input) in
      if (is_character c || is_digit c || is_underscore c) then
        (Buffer.add_char buf c; loop ())
      else
        (emit (ident_or_keyword (Buffer.contents buf)); next c)
    in
      (Buffer.add_char buf c; loop ())

  and lex_lparen_or_comment c =
    let c2 = (input_char input) in
    if is_star c2 then
      (emit LPARENSTAR; next (input_char input))
    else
      (emit LPAREN; next c2)

  and lex_star_or_comment c =
    let c2 = (input_char input) in
    if is_rparen c2 then
      (emit STARRPAREN; next (input_char input))
    else
      (emit STAR; next c2)

  and lex_eq_or_eqeq c =
    let c2 = (input_char input) in
    if is_eq c2 then
      (emit EQEQ; next (input_char input))
    else
      (emit EQ; next c2)

  and exit () = List.rev (!acc)
  in
    try
      next (input_char input)
    with
      | End_of_file -> exit ()


let rec main () =
  try
    List.iter print_token (lex stdin);
  with
    | Lex_error c -> Printf.printf "Char %s is unexpected.\n" (Char.escaped c)

;;  main ()
