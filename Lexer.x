{
module Lexer (lexer) where
import Expr
}

%wrapper "basic"

@ident = [_A-Za-z] [_A-Za-z0-9]*
@integer = [0-9]+

tokens :-

  $white+ ;
  "fun" {\s -> FUN}
  "let" {\s -> LET}
  "in" {\s -> IN}
  "forall" {\s -> FORALL}
  @ident {\s -> IDENT s}
  "(" {\s -> LPAREN}
  ")" {\s -> RPAREN}
  "[" {\s -> LBRACKET}
  "]" {\s -> RBRACKET}
  "=" {\s -> EQUALS}
  "->" {\s -> ARROW}
  "," {\s -> COMMA}

{
lexer = alexScanTokens
}
