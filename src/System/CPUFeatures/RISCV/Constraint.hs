{- |
Description: RISC-V features as nullary constraints

This module provides the constraint interface to detect CPU features.
You can mark your function with @Has\<FEATURE NAME\> =>@ to indicate that
it requires a specific CPU feature.
You can detect the availability and get the constraint @Has\<FEATURE NAME\>@
by pattern-matching on the variable @query\<FEATURE NAME\>@.

Example:

> -- This function requires the Vector extension
> someFunction :: HasV => ...
>
> case queryV of
>   Just Dict -> {- In this branch, HasV is available -} someFunction
>   Nothing -> {- In this branch, HasV is not available -} error "Vector extension not available"
-}
module System.CPUFeatures.RISCV.Constraint
  (HasC, queryC
  ,HasV, queryV
  ,HasZba, queryZba
  ,HasZbb, queryZbb
  ,HasZbs, queryZbs
  ,HasZicboz, queryZicboz
  ,HasZbc, queryZbc
  ,HasZbkb, queryZbkb
  ,HasZbkc, queryZbkc
  ,HasZbkx, queryZbkx
  ,HasZknd, queryZknd
  ,HasZkne, queryZkne
  ,HasZknh, queryZknh
  ,HasZksed, queryZksed
  ,HasZksh, queryZksh
  ,HasZkt, queryZkt
  ,HasZvbb, queryZvbb
  ,HasZvbc, queryZvbc
  ,HasZvkb, queryZvkb
  ,HasZvkg, queryZvkg
  ,HasZvkned, queryZvkned
  ,HasZvknha, queryZvknha
  ,HasZvknhb, queryZvknhb
  ,HasZvksed, queryZvksed
  ,HasZvksh, queryZvksh
  ,HasZvkt, queryZvkt
  ,HasZfh, queryZfh
  ,HasZfhmin, queryZfhmin
  ,HasZihintntl, queryZihintntl
  ,HasZvfh, queryZvfh
  ,HasZvfhmin, queryZvfhmin
  ,HasZfa, queryZfa
  ,HasZtso, queryZtso
  ,HasZacas, queryZacas
  ,HasZicntr, queryZicntr
  ,HasZicond, queryZicond
  ,HasZihintpause, queryZihintpause
  ,HasZihpm, queryZihpm
  ,HasZve32x, queryZve32x
  ,HasZve32f, queryZve32f
  ,HasZve64x, queryZve64x
  ,HasZve64f, queryZve64f
  ,HasZve64d, queryZve64d
  ,HasZimop, queryZimop
  ,HasZca, queryZca
  ,HasZcb, queryZcb
  ,HasZcd, queryZcd
  ,HasZcf, queryZcf
  ,HasZcmop, queryZcmop
  ,HasZawrs, queryZawrs
  ,HasZaamo, queryZaamo
  ,HasZalrsc, queryZalrsc
  ,HasSupm, querySupm
  ,HasZfbfmin, queryZfbfmin
  ,HasZvfbfmin, queryZvfbfmin
  ,HasZvfbfwma, queryZvfbfwma
  ,HasZicbom, queryZicbom
  ,Dict(Dict)
  ) where
import System.CPUFeatures.RISCV.Constraint.Unsafe
