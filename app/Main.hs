{-# LANGUAGE DataKinds #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Prelude (IO, putStrLn)
import PlutusTx (compile)
import PlutusTx.Code (CompiledCode)
import PlutusTx.Prelude

-- A simple validator that always succeeds
{-# INLINABLE mkSimpleValidator #-}
mkSimpleValidator :: BuiltinData -> BuiltinData -> BuiltinData -> ()
mkSimpleValidator _ _ _ = ()

-- Compile the validator to Plutus Core
validatorCompiled :: CompiledCode (BuiltinData -> BuiltinData -> BuiltinData -> ())
validatorCompiled = $$(compile [|| mkSimpleValidator ||])

main :: IO ()
main = putStrLn "Simple DeFi validator compiled successfully!"
