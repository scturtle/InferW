module Expr where

import           Data.List (intercalate)

data Token = FUN
           | LET
           | IN
           | FORALL
           | IDENT String
           | LPAREN
           | RPAREN
           | LBRACKET
           | RBRACKET
           | EQUALS
           | ARROW
           | COMMA
           deriving (Eq,Show)

type Name = String

data Expr = Var Name
          | Call Expr [Expr]
          | Fun [Name] Expr
          | Let Name Expr Expr
          deriving (Eq,Show)

type Id = Int
type Level = Int

data Ty = TConst Name
        | TVar Name
        | TApp Ty [Ty]
        | TArrow [Ty] Ty
        | TScheme [Name] Ty
        deriving (Eq,Ord)

show' t@(TArrow _ _) = "(" ++ show t ++ ")"
show' t = show t

instance Show Ty where
        show (TConst n) = n
        show (TVar n) = n
        show (TApp t ts) = show t ++ "[" ++ intercalate ", " (map show ts) ++ "]"
        show (TArrow ts t) = intercalate " -> " (map show' ts) ++ " -> " ++ show t
        show (TScheme ns t) = "forall[" ++ unwords ns ++ "] " ++ show t
