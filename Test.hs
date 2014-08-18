module Test where

import           Control.Monad.State
import qualified Data.Map            as Map
import           Data.Maybe          (fromJust)
import           Expr
import           Infer               (inferType)
import           Lexer               (lexer)
import           Parser              (parseExpr, parseTy)
import           Test.HUnit

core = [ ("head", "forall[a] list[a] -> a")
       , ("tail", "forall[a] list[a] -> list[a]")
       , ("nil", "forall[a] list[a]")
       , ("cons", "forall[a] (a, list[a]) -> list[a]")
       , ("cons_curry", "forall[a] a -> list[a] -> list[a]")
       , ("map", "forall[a b] (a -> b, list[a]) -> list[b]")
       , ("map_curry", "forall[a b] (a -> b) -> list[a] -> list[b]")
       , ("one", "int")
       , ("zero", "int")
       , ("succ", "int -> int")
       , ("plus", "(int, int) -> int")
       , ("eq", "forall[a] (a, a) -> bool")
       , ("eq_curry", "forall[a] a -> a -> bool")
       , ("not", "bool -> bool")
       , ("true", "bool")
       , ("false", "bool")
       , ("pair", "forall[a b] (a, b) -> pair[a, b]")
       , ("pair_curry", "forall[a b] a -> b -> pair[a, b]")
       , ("first", "forall[a b] pair[a, b] -> a")
       , ("second", "forall[a b] pair[a, b] -> b")
       , ("id", "forall[a] a -> a")
       , ("const", "forall[a b] a -> b -> a")
       , ("apply", "forall[a b] (a -> b, a) -> b")
       , ("apply_curry", "forall[a b] (a -> b) -> a -> b")
       , ("choose", "forall[a] (a, a) -> a")
       , ("choose_curry", "forall[a] a -> a -> a")]

inferCases = [ ("id", "forall[a] a -> a")
             , ("one", "int")
             , ("let x = id in x", "forall[a] a -> a")
             , ("let x = fun y -> y in x", "forall[a] a -> a")
             , ("fun x -> x", "forall[a] a -> a")
             {-, ("fun x -> x", "forall[int] int -> int")-}
             , ("pair", "forall[a b] (a, b) -> pair[a, b]")
             {-, ("pair", "forall[z x] (x, z) -> pair[x, z]")-}
             , ("fun x -> let y = fun z -> z in y", "forall[a b] a -> b -> b")
             , ("let f = fun x -> x in let id = fun y -> y in eq(f, id)", "bool")
             , ("let f = fun x -> x in let id = fun y -> y in eq_curry(f)(id)", "bool")
             , ("let f = fun x -> x in eq(f, succ)", "bool")
             , ("let f = fun x -> x in eq_curry(f)(succ)", "bool")
             , ("let f = fun x -> x in pair(f(one), f(true))", "pair[int, bool]")
             , ("let f = fun x y -> let a = eq(x, y) in eq(x, y) in f", "forall[a] (a, a) -> bool")
             , ("let f = fun x y -> let a = eq_curry(x)(y) in eq_curry(x)(y) in f", "forall[a] (a, a) -> bool")
             , ("id(id)", "forall[a] a -> a")
             , ("choose(fun x y -> x, fun x y -> y)", "forall[a] (a, a) -> a")
             , ("choose_curry(fun x y -> x)(fun x y -> y)", "forall[a] (a, a) -> a")
             , ("let x = id in let y = let z = x(id) in z in y", "forall[a] a -> a")
             , ("cons(id, nil)", "forall[a] list[a -> a]")
             , ("cons_curry(id)(nil)", "forall[a] list[a -> a]")
             , ("let lst1 = cons(id, nil) in let lst2 = cons(succ, lst1) in lst2", "list[int -> int]")
             , ("cons_curry(id)(cons_curry(succ)(cons_curry(id)(nil)))", "list[int -> int]")
             , ("fun x -> let y = x in y", "forall[a] a -> a")
             , ("fun x -> let y = let z = x(fun x -> x) in z in y", "forall[a b] ((a -> a) -> b) -> b")
             , ("fun x -> fun y -> let x = x(y) in x(y)", "forall[a b] (a -> a -> b) -> a -> b")
             , ("fun x -> let y = fun z -> x(z) in y", "forall[a b] (a -> b) -> a -> b")
             , ("fun x -> let y = fun z -> x in y", "forall[a b] a -> b -> a")
             , ("fun x -> fun y -> let x = x(y) in fun x -> y(x)", "forall[a b c] ((a -> b) -> c) -> (a -> b) -> a -> b")
             , ("fun x -> let y = fun z -> z in y(y)", "forall[a b] a -> b -> b")
             , ("fun f -> let x = fun g y -> let _ = g(y) in eq(f, g) in x", "forall[a b] (a -> b) -> (a -> b, a) -> bool")
             , ("let const = fun x -> fun y -> x in const", "forall[a b] a -> b -> a")
             , ("let apply = fun f x -> f(x) in apply", "forall[a b] (a -> b, a) -> b")
             , ("let apply_curry = fun f -> fun x -> f(x) in apply_curry", "forall[a b] (a -> b) -> a -> b")]

testEnv = Map.fromList [(n, fromJust . parseTy . lexer $ t) | (n, t) <- core]

testInfer s = let e = fromJust . parseExpr . lexer $ s
              in  evalState (inferType testEnv e) 0

testList = [ TestCase $ assertEqual "Lexer test 1"
                                    (lexer "())in,let_ _1Ma->==")
                                    [LPAREN,RPAREN,RPAREN,IN,COMMA ,IDENT "let_",IDENT "_1Ma",ARROW,EQUALS,EQUALS]
           , TestCase $ assertEqual "Lexer test 2"
                                    (lexer "let fun in")
                                    [LET,FUN,IN]
           , TestCase $ assertEqual "Lexer test 3"
                                    (parseExpr . lexer $ "a")
                                    (Just (Var "a"))
           , TestCase $ assertEqual "Parser test 1"
                                    (parseExpr . lexer $ "f(x, y)")
                                    (Just (Call (Var "f") [Var "x",Var "y"]))
           , TestCase $ assertEqual "Parser test 2"
                                    (parseExpr . lexer $ "f(x)(y)")
                                    (Just (Call (Call (Var "f") [Var "x"]) [Var "y"]))
           , TestCase $ assertEqual "Parser test 3"
                                    (parseExpr . lexer $ "let f = fun x y -> g(x, y) in f(a, b)")
                                    (Just (Let "f" (Fun ["x","y"] (Call (Var "g") [Var "x",Var "y"]))
                                                   (Call (Var "f") [Var "a",Var "b"])))
           , TestCase $ assertEqual "Parser test 4"
                                    (parseExpr . lexer $ "let x = a in let y = b in f(x, y)")
                                    (Just (Let "x" (Var "a") (Let "y" (Var "b") (Call (Var "f") [Var "x",Var "y"]))))
           ]

inferList = [TestCase $ assertEqual ("Infer: " ++ s)
                                    (testInfer s)
                                    (fromJust . parseTy . lexer $ result)
            | (s, result) <- inferCases]

main = do putStrLn "Test lexer and parser:"
          runTestTT $ TestList testList
          putStrLn "\nTest infer:"
          runTestTT $ TestList inferList

