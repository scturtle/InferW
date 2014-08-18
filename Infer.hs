module Infer where

import           Control.Applicative ((<$>))
import           Control.Monad.State
import           Data.List           (nub, (\\))
import qualified Data.Map            as Map
import           Data.Maybe          (fromMaybe)
import qualified Data.Set            as Set
import           Expr

ftv :: Ty -> Set.Set Name
ftv (TConst _) = Set.empty
ftv (TVar n) = Set.singleton n
ftv (TApp t ts) = Set.unions . map ftv $ t : ts
ftv (TArrow ts t) = Set.unions . map ftv $ t : ts
ftv (TScheme ns t) = ftv t `Set.difference` Set.fromList ns

apply :: Sub -> Ty -> Ty
apply _ ot@(TConst _) = ot
apply s ot@(TVar n) = fromMaybe ot (Map.lookup n s)
apply s (TApp t ts) = TApp (apply s t) (map (apply s) ts)
apply s (TArrow ts t) = TArrow (map (apply s) ts) (apply s t)
apply s (TScheme ns t) = TScheme ns (apply (foldr Map.delete s ns) t)

type Sub = Map.Map Name Ty

compose :: Sub -> Sub -> Sub
compose s1 s2 = Map.map (apply s1) s2 `Map.union` s1

type TypeEnv = Map.Map Name Ty

generalize :: TypeEnv -> Ty -> Ty
generalize _ ot@(TScheme _ _) = ot
generalize env t = let fenv = Set.unions . map ftv . Map.elems $ env
                       fvs = Set.toList $ ftv t `Set.difference` fenv
                   in if null fvs then t else TScheme fvs t

type Env a = State Int a

newTyVar :: String -> Env Ty
newTyVar prefix =
        do n <- get
           put $ n + 1
           return $ TVar (prefix ++ show n)

instantiate :: Ty -> Env Ty
instantiate (TScheme ns t) =
        do ns' <- mapM (\ _ -> newTyVar "a") ns
           let s = Map.fromList $ zip ns ns'
           return $ apply s t
instantiate t = return t

unify :: Ty -> Ty -> Env Sub
unify (TConst n1) (TConst n2) =
        if n1 == n2
            then return Map.empty
            else error "not match"
unify (TApp t1 ts1) (TApp t2 ts2) = unify (TArrow ts1 t1) (TArrow ts2 t2)
unify (TArrow ts1 t1) (TArrow ts2 t2) =
        if length ts1 /= length ts2
            then error "not macth"
            else do s0 <- unify t1 t2
                    let f s (ta, tb) = compose s <$> unify (apply s ta) (apply s tb)
                    foldM f s0 (zip ts1 ts2)
unify (TVar n) t = varBind n t
unify t (TVar n) = varBind n t
unify _ _ = error "not match"

varBind :: Name -> Ty -> Env Sub
varBind n t | t == TVar n = return Map.empty
            | n `Set.member` ftv t = error $ "occur check fails: " ++ n
            | otherwise = return $ Map.singleton n t

infer :: TypeEnv -> Expr -> Env (Sub, Ty)
infer env (Var n) =
        case Map.lookup n env of
            Nothing -> error $ "unbounded variable: " ++ n
            Just sigma -> do t <- instantiate sigma
                             return (Map.empty, t)
infer env (Call e es) =
        do tv <- newTyVar "a"
           (s1, t1) <- infer env e
           (s2, ts) <- foldM f (s1, []) es
           s3 <- unify (apply s2 t1) (TArrow ts tv)
           return (s3 `compose` s2 `compose` s1, apply s3 tv)
    where f (s0, ts) e2 = do (se, te) <- infer (Map.map (apply s0) env) e2
                             return $ (se `compose` s0, ts ++ [te])
infer env (Fun ns e) =
        do ns' <- mapM (\ _ -> newTyVar "a") ns
           let env' = foldr Map.delete env ns
               env'' = env' `Map.union` (Map.fromList $ zip ns ns')
           (s1, t1) <- infer env'' e
           return $ (s1, TArrow (map (apply s1) ns') t1)
infer env (Let n e1 e2) =
        do (s1, t1) <- infer env e1
           let env' = Map.delete n env
               t' = generalize (Map.map (apply s1) env) (apply s1 t1) -- fix?
               env'' = Map.insert n t' env'
           (s2, t2) <- infer (Map.map (apply s1) env'') e2
           return (s2 `compose` s1, t2)

inferType :: TypeEnv -> Expr -> Env Ty
inferType env e =
        do (s, t) <- infer env e
           let ty = apply s t
               fenv = Set.unions . map ftv . Map.elems $ env
               fvs = nub (vars ty) \\ Set.toList fenv
               s2 = Map.fromList $ zip fvs $ [TVar (c:[]) | c <- ['a' ..]]
           return $ generalize env $ apply s2 ty
    where vars (TVar n) = [n]
          vars (TApp t ts) = vars t ++ concatMap vars ts
          vars (TArrow ts t) = concatMap vars ts ++ vars t
          vars _ = []
