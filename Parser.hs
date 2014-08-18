{-# OPTIONS_GHC -w #-}
module Parser (parseExpr, parseTy) where
import Expr
import Control.Applicative(Applicative(..))

-- parser produced by Happy Version 1.19.4

data HappyAbsSyn t5 t6 t7 t8 t9 t10 t11
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11

action_0 (12) = happyShift action_12
action_0 (13) = happyShift action_13
action_0 (16) = happyShift action_4
action_0 (17) = happyShift action_5
action_0 (5) = happyGoto action_11
action_0 (6) = happyGoto action_3
action_0 _ = happyFail

action_1 (15) = happyShift action_8
action_1 (16) = happyShift action_9
action_1 (17) = happyShift action_10
action_1 (9) = happyGoto action_6
action_1 (10) = happyGoto action_7
action_1 _ = happyFail

action_2 (16) = happyShift action_4
action_2 (17) = happyShift action_5
action_2 (6) = happyGoto action_3
action_2 _ = happyFail

action_3 (17) = happyShift action_23
action_3 _ = happyReduce_2

action_4 _ = happyReduce_5

action_5 (12) = happyShift action_12
action_5 (13) = happyShift action_13
action_5 (16) = happyShift action_4
action_5 (17) = happyShift action_5
action_5 (5) = happyGoto action_22
action_5 (6) = happyGoto action_3
action_5 _ = happyFail

action_6 (24) = happyAccept
action_6 _ = happyFail

action_7 (19) = happyShift action_20
action_7 (22) = happyShift action_21
action_7 _ = happyReduce_13

action_8 (19) = happyShift action_19
action_8 _ = happyFail

action_9 _ = happyReduce_18

action_10 (15) = happyShift action_8
action_10 (16) = happyShift action_9
action_10 (17) = happyShift action_10
action_10 (18) = happyShift action_18
action_10 (9) = happyGoto action_17
action_10 (10) = happyGoto action_7
action_10 _ = happyFail

action_11 (24) = happyAccept
action_11 _ = happyFail

action_12 (16) = happyShift action_16
action_12 (7) = happyGoto action_15
action_12 _ = happyFail

action_13 (16) = happyShift action_14
action_13 _ = happyFail

action_14 (21) = happyShift action_37
action_14 _ = happyFail

action_15 (22) = happyShift action_36
action_15 _ = happyFail

action_16 (16) = happyShift action_16
action_16 (7) = happyGoto action_35
action_16 _ = happyReduce_9

action_17 (18) = happyShift action_33
action_17 (23) = happyShift action_34
action_17 _ = happyFail

action_18 (22) = happyShift action_32
action_18 _ = happyFail

action_19 (16) = happyShift action_16
action_19 (7) = happyGoto action_31
action_19 _ = happyFail

action_20 (15) = happyShift action_8
action_20 (16) = happyShift action_9
action_20 (17) = happyShift action_10
action_20 (9) = happyGoto action_29
action_20 (10) = happyGoto action_7
action_20 (11) = happyGoto action_30
action_20 _ = happyFail

action_21 (15) = happyShift action_8
action_21 (16) = happyShift action_9
action_21 (17) = happyShift action_10
action_21 (9) = happyGoto action_28
action_21 (10) = happyGoto action_7
action_21 _ = happyFail

action_22 (18) = happyShift action_27
action_22 _ = happyFail

action_23 (12) = happyShift action_12
action_23 (13) = happyShift action_13
action_23 (16) = happyShift action_4
action_23 (17) = happyShift action_5
action_23 (18) = happyShift action_26
action_23 (5) = happyGoto action_24
action_23 (6) = happyGoto action_3
action_23 (8) = happyGoto action_25
action_23 _ = happyFail

action_24 (23) = happyShift action_46
action_24 _ = happyReduce_11

action_25 (18) = happyShift action_45
action_25 _ = happyFail

action_26 _ = happyReduce_8

action_27 _ = happyReduce_6

action_28 _ = happyReduce_15

action_29 (23) = happyShift action_44
action_29 _ = happyReduce_21

action_30 (20) = happyShift action_43
action_30 _ = happyFail

action_31 (20) = happyShift action_42
action_31 _ = happyFail

action_32 (15) = happyShift action_8
action_32 (16) = happyShift action_9
action_32 (17) = happyShift action_10
action_32 (9) = happyGoto action_41
action_32 (10) = happyGoto action_7
action_32 _ = happyFail

action_33 _ = happyReduce_20

action_34 (15) = happyShift action_8
action_34 (16) = happyShift action_9
action_34 (17) = happyShift action_10
action_34 (9) = happyGoto action_29
action_34 (10) = happyGoto action_7
action_34 (11) = happyGoto action_40
action_34 _ = happyFail

action_35 _ = happyReduce_10

action_36 (12) = happyShift action_12
action_36 (13) = happyShift action_13
action_36 (16) = happyShift action_4
action_36 (17) = happyShift action_5
action_36 (5) = happyGoto action_39
action_36 (6) = happyGoto action_3
action_36 _ = happyFail

action_37 (12) = happyShift action_12
action_37 (13) = happyShift action_13
action_37 (16) = happyShift action_4
action_37 (17) = happyShift action_5
action_37 (5) = happyGoto action_38
action_37 (6) = happyGoto action_3
action_37 _ = happyFail

action_38 (14) = happyShift action_51
action_38 _ = happyFail

action_39 _ = happyReduce_4

action_40 (18) = happyShift action_50
action_40 _ = happyFail

action_41 _ = happyReduce_14

action_42 (15) = happyShift action_8
action_42 (16) = happyShift action_9
action_42 (17) = happyShift action_10
action_42 (9) = happyGoto action_49
action_42 (10) = happyGoto action_7
action_42 _ = happyFail

action_43 _ = happyReduce_19

action_44 (15) = happyShift action_8
action_44 (16) = happyShift action_9
action_44 (17) = happyShift action_10
action_44 (9) = happyGoto action_29
action_44 (10) = happyGoto action_7
action_44 (11) = happyGoto action_48
action_44 _ = happyFail

action_45 _ = happyReduce_7

action_46 (12) = happyShift action_12
action_46 (13) = happyShift action_13
action_46 (16) = happyShift action_4
action_46 (17) = happyShift action_5
action_46 (5) = happyGoto action_24
action_46 (6) = happyGoto action_3
action_46 (8) = happyGoto action_47
action_46 _ = happyFail

action_47 _ = happyReduce_12

action_48 _ = happyReduce_22

action_49 _ = happyReduce_17

action_50 (22) = happyShift action_53
action_50 _ = happyFail

action_51 (12) = happyShift action_12
action_51 (13) = happyShift action_13
action_51 (16) = happyShift action_4
action_51 (17) = happyShift action_5
action_51 (5) = happyGoto action_52
action_51 (6) = happyGoto action_3
action_51 _ = happyFail

action_52 _ = happyReduce_3

action_53 (15) = happyShift action_8
action_53 (16) = happyShift action_9
action_53 (17) = happyShift action_10
action_53 (9) = happyGoto action_54
action_53 (10) = happyGoto action_7
action_53 _ = happyFail

action_54 _ = happyReduce_16

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happyReduce 6 5 happyReduction_3
happyReduction_3 ((HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IDENT happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 4 5 happyReduction_4
happyReduction_4 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Fun happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyTerminal (IDENT happy_var_1))
	 =  HappyAbsSyn6
		 (Var happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  6 happyReduction_6
happyReduction_6 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happyReduce 4 6 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Call happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 _
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Call happy_var_1 []
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  7 happyReduction_9
happyReduction_9 (HappyTerminal (IDENT happy_var_1))
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  7 happyReduction_10
happyReduction_10 (HappyAbsSyn7  happy_var_2)
	(HappyTerminal (IDENT happy_var_1))
	 =  HappyAbsSyn7
		 (happy_var_1 : happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  8 happyReduction_11
happyReduction_11 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  8 happyReduction_12
happyReduction_12 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 : happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  9 happyReduction_13
happyReduction_13 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happyReduce 4 9 happyReduction_14
happyReduction_14 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (TArrow [] happy_var_4
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_3  9 happyReduction_15
happyReduction_15 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (TArrow [happy_var_1] happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happyReduce 7 9 happyReduction_16
happyReduction_16 ((HappyAbsSyn9  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (TArrow (happy_var_2 : happy_var_4) happy_var_7
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 5 9 happyReduction_17
happyReduction_17 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (tranConstToVar happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_1  10 happyReduction_18
happyReduction_18 (HappyTerminal (IDENT happy_var_1))
	 =  HappyAbsSyn10
		 (TConst happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happyReduce 4 10 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (TApp happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_20 = happySpecReduce_3  10 happyReduction_20
happyReduction_20 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (happy_var_2
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  11 happyReduction_21
happyReduction_21 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn11
		 ([happy_var_1]
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  11 happyReduction_22
happyReduction_22 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1 : happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 24 24 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	FUN -> cont 12;
	LET -> cont 13;
	IN -> cont 14;
	FORALL -> cont 15;
	IDENT happy_dollar_dollar -> cont 16;
	LPAREN -> cont 17;
	RPAREN -> cont 18;
	LBRACKET -> cont 19;
	RBRACKET -> cont 20;
	EQUALS -> cont 21;
	ARROW -> cont 22;
	COMMA -> cont 23;
	_ -> happyError' (tk:tks)
	}

happyError_ 24 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

happyThen :: () => Maybe a -> (a -> Maybe b) -> Maybe b
happyThen = (>>=)
happyReturn :: () => a -> Maybe a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Maybe a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [(Token)] -> Maybe a
happyError' = happyError

parseExpr tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn5 z -> happyReturn z; _other -> notHappyAtAll })

parseTy tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn9 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


happyError _ = Nothing

tranConstToVar ns t = TScheme ns (tran t)
    where tran (TConst n) = if n `elem` ns then (TVar n) else (TConst n)
          tran (TApp t ts) = TApp (tran t) (map tran ts)
          tran (TArrow ts t) = TArrow (map tran ts) (tran t)
	  tran _ = error "error in tran"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 


{-# LINE 13 "templates/GenericTemplate.hs" #-}


{-# LINE 46 "templates/GenericTemplate.hs" #-}









{-# LINE 67 "templates/GenericTemplate.hs" #-}


{-# LINE 77 "templates/GenericTemplate.hs" #-}










infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action


{-# LINE 155 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.

