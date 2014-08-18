{
module Parser (parseExpr, parseTy) where
import Expr
}

%name parseExpr expr
%name parseTy ty

%monad {Maybe} 
%tokentype { Token }

%token
    FUN     	{ FUN }
    LET     	{ LET }
    IN       	{ IN }
    FORALL   	{ FORALL }
    IDENT       { IDENT $$ }
    LPAREN  	{ LPAREN }
    RPAREN  	{ RPAREN }
    LBRACKET	{ LBRACKET }
    RBRACKET	{ RBRACKET }
    EQUALS	{ EQUALS }
    ARROW	{ ARROW }
    COMMA	{ COMMA }

%%

expr: simple_expr                         { $1 }
    | LET IDENT EQUALS expr IN expr       { Let $2 $4 $6 }
    | FUN ident_list ARROW expr           { Fun $2 $4 }

simple_expr: IDENT                                             { Var $1 }
           | LPAREN expr RPAREN                                { $2 }
           | simple_expr LPAREN expr_comma_list RPAREN         { Call $1 $3 }
           | simple_expr LPAREN RPAREN                         { Call $1 [] }

ident_list: IDENT               { [$1] }
          | IDENT ident_list    { $1 : $2 }

expr_comma_list: expr                          { [$1] }
               | expr COMMA expr_comma_list    { $1 : $3 }

ty: simple_ty                                         { $1 }
  | LPAREN RPAREN ARROW ty                            { TArrow [] $4 }
  | simple_ty ARROW ty                                { TArrow [$1] $3 }
  | LPAREN ty COMMA ty_comma_list RPAREN ARROW ty     { TArrow ($2 : $4) $7 }
  | FORALL LBRACKET ident_list RBRACKET ty            { tranConstToVar $3 $5 }

simple_ty: IDENT                                         { TConst $1 }
         | simple_ty LBRACKET ty_comma_list RBRACKET     { TApp $1 $3 }
         | LPAREN ty RPAREN                              { $2 }

ty_comma_list: ty                        { [$1] }
             | ty COMMA ty_comma_list    { $1 : $3 }

{
happyError _ = Nothing

tranConstToVar ns t = TScheme ns (tran t)
    where tran (TConst n) = if n `elem` ns then (TVar n) else (TConst n)
          tran (TApp t ts) = TApp (tran t) (map tran ts)
          tran (TArrow ts t) = TArrow (map tran ts) (tran t)
	  tran _ = error "error in tran"
}
