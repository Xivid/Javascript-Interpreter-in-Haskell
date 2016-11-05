{-# OPTIONS_GHC -w #-}
module Parser (parseExpr) where
import Data.Char (isDigit, isSpace, isAlpha)
import Prelude hiding (LT, GT, EQ)
import Data.List (stripPrefix)
import Declare
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

data HappyAbsSyn t4 t5 t6
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6

action_0 (7) = happyShift action_2
action_0 (8) = happyShift action_5
action_0 (9) = happyShift action_6
action_0 (10) = happyShift action_7
action_0 (11) = happyShift action_8
action_0 (13) = happyShift action_9
action_0 (14) = happyShift action_10
action_0 (21) = happyShift action_11
action_0 (25) = happyShift action_12
action_0 (35) = happyShift action_13
action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_4
action_0 _ = happyFail

action_1 (7) = happyShift action_2
action_1 _ = happyFail

action_2 (25) = happyShift action_32
action_2 _ = happyFail

action_3 (20) = happyShift action_20
action_3 (21) = happyShift action_21
action_3 (22) = happyShift action_22
action_3 (23) = happyShift action_23
action_3 (24) = happyShift action_24
action_3 (29) = happyShift action_25
action_3 (30) = happyShift action_26
action_3 (31) = happyShift action_27
action_3 (32) = happyShift action_28
action_3 (33) = happyShift action_29
action_3 (34) = happyShift action_30
action_3 (36) = happyShift action_31
action_3 (38) = happyAccept
action_3 _ = happyFail

action_4 (25) = happyShift action_19
action_4 _ = happyReduce_18

action_5 (9) = happyShift action_18
action_5 _ = happyFail

action_6 _ = happyReduce_20

action_7 _ = happyReduce_22

action_8 (25) = happyShift action_17
action_8 _ = happyFail

action_9 _ = happyReduce_23

action_10 _ = happyReduce_24

action_11 (7) = happyShift action_2
action_11 (8) = happyShift action_5
action_11 (9) = happyShift action_6
action_11 (10) = happyShift action_7
action_11 (11) = happyShift action_8
action_11 (13) = happyShift action_9
action_11 (14) = happyShift action_10
action_11 (21) = happyShift action_11
action_11 (25) = happyShift action_12
action_11 (35) = happyShift action_13
action_11 (4) = happyGoto action_16
action_11 (5) = happyGoto action_4
action_11 _ = happyFail

action_12 (7) = happyShift action_2
action_12 (8) = happyShift action_5
action_12 (9) = happyShift action_6
action_12 (10) = happyShift action_7
action_12 (11) = happyShift action_8
action_12 (13) = happyShift action_9
action_12 (14) = happyShift action_10
action_12 (21) = happyShift action_11
action_12 (25) = happyShift action_12
action_12 (35) = happyShift action_13
action_12 (4) = happyGoto action_15
action_12 (5) = happyGoto action_4
action_12 _ = happyFail

action_13 (7) = happyShift action_2
action_13 (8) = happyShift action_5
action_13 (9) = happyShift action_6
action_13 (10) = happyShift action_7
action_13 (11) = happyShift action_8
action_13 (13) = happyShift action_9
action_13 (14) = happyShift action_10
action_13 (21) = happyShift action_11
action_13 (25) = happyShift action_12
action_13 (35) = happyShift action_13
action_13 (4) = happyGoto action_14
action_13 (5) = happyGoto action_4
action_13 _ = happyFail

action_14 _ = happyReduce_17

action_15 (20) = happyShift action_20
action_15 (21) = happyShift action_21
action_15 (22) = happyShift action_22
action_15 (23) = happyShift action_23
action_15 (24) = happyShift action_24
action_15 (26) = happyShift action_49
action_15 (29) = happyShift action_25
action_15 (30) = happyShift action_26
action_15 (31) = happyShift action_27
action_15 (32) = happyShift action_28
action_15 (33) = happyShift action_29
action_15 (34) = happyShift action_30
action_15 (36) = happyShift action_31
action_15 _ = happyFail

action_16 _ = happyReduce_16

action_17 (7) = happyShift action_2
action_17 (8) = happyShift action_5
action_17 (9) = happyShift action_6
action_17 (10) = happyShift action_7
action_17 (11) = happyShift action_8
action_17 (13) = happyShift action_9
action_17 (14) = happyShift action_10
action_17 (21) = happyShift action_11
action_17 (25) = happyShift action_12
action_17 (35) = happyShift action_13
action_17 (4) = happyGoto action_48
action_17 (5) = happyGoto action_4
action_17 _ = happyFail

action_18 (17) = happyShift action_47
action_18 _ = happyFail

action_19 (7) = happyShift action_2
action_19 (8) = happyShift action_5
action_19 (9) = happyShift action_6
action_19 (10) = happyShift action_7
action_19 (11) = happyShift action_8
action_19 (13) = happyShift action_9
action_19 (14) = happyShift action_10
action_19 (21) = happyShift action_11
action_19 (25) = happyShift action_12
action_19 (35) = happyShift action_13
action_19 (4) = happyGoto action_46
action_19 (5) = happyGoto action_4
action_19 _ = happyFail

action_20 (7) = happyShift action_2
action_20 (8) = happyShift action_5
action_20 (9) = happyShift action_6
action_20 (10) = happyShift action_7
action_20 (11) = happyShift action_8
action_20 (13) = happyShift action_9
action_20 (14) = happyShift action_10
action_20 (21) = happyShift action_11
action_20 (25) = happyShift action_12
action_20 (35) = happyShift action_13
action_20 (4) = happyGoto action_45
action_20 (5) = happyGoto action_4
action_20 _ = happyFail

action_21 (7) = happyShift action_2
action_21 (8) = happyShift action_5
action_21 (9) = happyShift action_6
action_21 (10) = happyShift action_7
action_21 (11) = happyShift action_8
action_21 (13) = happyShift action_9
action_21 (14) = happyShift action_10
action_21 (21) = happyShift action_11
action_21 (25) = happyShift action_12
action_21 (35) = happyShift action_13
action_21 (4) = happyGoto action_44
action_21 (5) = happyGoto action_4
action_21 _ = happyFail

action_22 (7) = happyShift action_2
action_22 (8) = happyShift action_5
action_22 (9) = happyShift action_6
action_22 (10) = happyShift action_7
action_22 (11) = happyShift action_8
action_22 (13) = happyShift action_9
action_22 (14) = happyShift action_10
action_22 (21) = happyShift action_11
action_22 (25) = happyShift action_12
action_22 (35) = happyShift action_13
action_22 (4) = happyGoto action_43
action_22 (5) = happyGoto action_4
action_22 _ = happyFail

action_23 (7) = happyShift action_2
action_23 (8) = happyShift action_5
action_23 (9) = happyShift action_6
action_23 (10) = happyShift action_7
action_23 (11) = happyShift action_8
action_23 (13) = happyShift action_9
action_23 (14) = happyShift action_10
action_23 (21) = happyShift action_11
action_23 (25) = happyShift action_12
action_23 (35) = happyShift action_13
action_23 (4) = happyGoto action_42
action_23 (5) = happyGoto action_4
action_23 _ = happyFail

action_24 (7) = happyShift action_2
action_24 (8) = happyShift action_5
action_24 (9) = happyShift action_6
action_24 (10) = happyShift action_7
action_24 (11) = happyShift action_8
action_24 (13) = happyShift action_9
action_24 (14) = happyShift action_10
action_24 (21) = happyShift action_11
action_24 (25) = happyShift action_12
action_24 (35) = happyShift action_13
action_24 (4) = happyGoto action_41
action_24 (5) = happyGoto action_4
action_24 _ = happyFail

action_25 (7) = happyShift action_2
action_25 (8) = happyShift action_5
action_25 (9) = happyShift action_6
action_25 (10) = happyShift action_7
action_25 (11) = happyShift action_8
action_25 (13) = happyShift action_9
action_25 (14) = happyShift action_10
action_25 (21) = happyShift action_11
action_25 (25) = happyShift action_12
action_25 (35) = happyShift action_13
action_25 (4) = happyGoto action_40
action_25 (5) = happyGoto action_4
action_25 _ = happyFail

action_26 (7) = happyShift action_2
action_26 (8) = happyShift action_5
action_26 (9) = happyShift action_6
action_26 (10) = happyShift action_7
action_26 (11) = happyShift action_8
action_26 (13) = happyShift action_9
action_26 (14) = happyShift action_10
action_26 (21) = happyShift action_11
action_26 (25) = happyShift action_12
action_26 (35) = happyShift action_13
action_26 (4) = happyGoto action_39
action_26 (5) = happyGoto action_4
action_26 _ = happyFail

action_27 (7) = happyShift action_2
action_27 (8) = happyShift action_5
action_27 (9) = happyShift action_6
action_27 (10) = happyShift action_7
action_27 (11) = happyShift action_8
action_27 (13) = happyShift action_9
action_27 (14) = happyShift action_10
action_27 (21) = happyShift action_11
action_27 (25) = happyShift action_12
action_27 (35) = happyShift action_13
action_27 (4) = happyGoto action_38
action_27 (5) = happyGoto action_4
action_27 _ = happyFail

action_28 (7) = happyShift action_2
action_28 (8) = happyShift action_5
action_28 (9) = happyShift action_6
action_28 (10) = happyShift action_7
action_28 (11) = happyShift action_8
action_28 (13) = happyShift action_9
action_28 (14) = happyShift action_10
action_28 (21) = happyShift action_11
action_28 (25) = happyShift action_12
action_28 (35) = happyShift action_13
action_28 (4) = happyGoto action_37
action_28 (5) = happyGoto action_4
action_28 _ = happyFail

action_29 (7) = happyShift action_2
action_29 (8) = happyShift action_5
action_29 (9) = happyShift action_6
action_29 (10) = happyShift action_7
action_29 (11) = happyShift action_8
action_29 (13) = happyShift action_9
action_29 (14) = happyShift action_10
action_29 (21) = happyShift action_11
action_29 (25) = happyShift action_12
action_29 (35) = happyShift action_13
action_29 (4) = happyGoto action_36
action_29 (5) = happyGoto action_4
action_29 _ = happyFail

action_30 (7) = happyShift action_2
action_30 (8) = happyShift action_5
action_30 (9) = happyShift action_6
action_30 (10) = happyShift action_7
action_30 (11) = happyShift action_8
action_30 (13) = happyShift action_9
action_30 (14) = happyShift action_10
action_30 (21) = happyShift action_11
action_30 (25) = happyShift action_12
action_30 (35) = happyShift action_13
action_30 (4) = happyGoto action_35
action_30 (5) = happyGoto action_4
action_30 _ = happyFail

action_31 (7) = happyShift action_2
action_31 (8) = happyShift action_5
action_31 (9) = happyShift action_6
action_31 (10) = happyShift action_7
action_31 (11) = happyShift action_8
action_31 (13) = happyShift action_9
action_31 (14) = happyShift action_10
action_31 (21) = happyShift action_11
action_31 (25) = happyShift action_12
action_31 (35) = happyShift action_13
action_31 (4) = happyGoto action_34
action_31 (5) = happyGoto action_4
action_31 _ = happyFail

action_32 (9) = happyShift action_33
action_32 _ = happyFail

action_33 (17) = happyShift action_56
action_33 _ = happyFail

action_34 (20) = happyShift action_20
action_34 (21) = happyShift action_21
action_34 (22) = happyShift action_22
action_34 (23) = happyShift action_23
action_34 (24) = happyShift action_24
action_34 (29) = happyShift action_25
action_34 (30) = happyShift action_26
action_34 (31) = happyShift action_27
action_34 (32) = happyShift action_28
action_34 (33) = happyShift action_29
action_34 (34) = happyShift action_30
action_34 _ = happyReduce_4

action_35 (20) = happyShift action_20
action_35 (21) = happyShift action_21
action_35 (22) = happyShift action_22
action_35 (23) = happyShift action_23
action_35 (24) = happyShift action_24
action_35 (29) = happyShift action_25
action_35 (30) = happyShift action_26
action_35 (31) = happyShift action_27
action_35 (32) = happyShift action_28
action_35 (33) = happyShift action_29
action_35 _ = happyReduce_5

action_36 (20) = happyShift action_20
action_36 (21) = happyShift action_21
action_36 (22) = happyShift action_22
action_36 (23) = happyShift action_23
action_36 (24) = happyShift action_24
action_36 (29) = happyShift action_25
action_36 (30) = happyShift action_26
action_36 (31) = happyShift action_27
action_36 (32) = happyShift action_28
action_36 (33) = happyFail
action_36 _ = happyReduce_6

action_37 (20) = happyShift action_20
action_37 (21) = happyShift action_21
action_37 (22) = happyShift action_22
action_37 (23) = happyShift action_23
action_37 (24) = happyShift action_24
action_37 (29) = happyFail
action_37 (30) = happyFail
action_37 (31) = happyFail
action_37 (32) = happyFail
action_37 _ = happyReduce_10

action_38 (20) = happyShift action_20
action_38 (21) = happyShift action_21
action_38 (22) = happyShift action_22
action_38 (23) = happyShift action_23
action_38 (24) = happyShift action_24
action_38 (29) = happyFail
action_38 (30) = happyFail
action_38 (31) = happyFail
action_38 (32) = happyFail
action_38 _ = happyReduce_8

action_39 (20) = happyShift action_20
action_39 (21) = happyShift action_21
action_39 (22) = happyShift action_22
action_39 (23) = happyShift action_23
action_39 (24) = happyShift action_24
action_39 (29) = happyFail
action_39 (30) = happyFail
action_39 (31) = happyFail
action_39 (32) = happyFail
action_39 _ = happyReduce_9

action_40 (20) = happyShift action_20
action_40 (21) = happyShift action_21
action_40 (22) = happyShift action_22
action_40 (23) = happyShift action_23
action_40 (24) = happyShift action_24
action_40 (29) = happyFail
action_40 (30) = happyFail
action_40 (31) = happyFail
action_40 (32) = happyFail
action_40 _ = happyReduce_7

action_41 (24) = happyShift action_24
action_41 _ = happyReduce_15

action_42 (24) = happyShift action_24
action_42 _ = happyReduce_14

action_43 (24) = happyShift action_24
action_43 _ = happyReduce_13

action_44 (22) = happyShift action_22
action_44 (23) = happyShift action_23
action_44 (24) = happyShift action_24
action_44 _ = happyReduce_12

action_45 (22) = happyShift action_22
action_45 (23) = happyShift action_23
action_45 (24) = happyShift action_24
action_45 _ = happyReduce_11

action_46 (20) = happyShift action_20
action_46 (21) = happyShift action_21
action_46 (22) = happyShift action_22
action_46 (23) = happyShift action_23
action_46 (24) = happyShift action_24
action_46 (26) = happyShift action_55
action_46 (29) = happyShift action_25
action_46 (30) = happyShift action_26
action_46 (31) = happyShift action_27
action_46 (32) = happyShift action_28
action_46 (33) = happyShift action_29
action_46 (34) = happyShift action_30
action_46 (36) = happyShift action_31
action_46 _ = happyFail

action_47 (15) = happyShift action_52
action_47 (16) = happyShift action_53
action_47 (25) = happyShift action_54
action_47 (6) = happyGoto action_51
action_47 _ = happyFail

action_48 (20) = happyShift action_20
action_48 (21) = happyShift action_21
action_48 (22) = happyShift action_22
action_48 (23) = happyShift action_23
action_48 (24) = happyShift action_24
action_48 (26) = happyShift action_50
action_48 (29) = happyShift action_25
action_48 (30) = happyShift action_26
action_48 (31) = happyShift action_27
action_48 (32) = happyShift action_28
action_48 (33) = happyShift action_29
action_48 (34) = happyShift action_30
action_48 (36) = happyShift action_31
action_48 _ = happyFail

action_49 _ = happyReduce_21

action_50 (7) = happyShift action_2
action_50 (8) = happyShift action_5
action_50 (9) = happyShift action_6
action_50 (10) = happyShift action_7
action_50 (11) = happyShift action_8
action_50 (13) = happyShift action_9
action_50 (14) = happyShift action_10
action_50 (21) = happyShift action_11
action_50 (25) = happyShift action_12
action_50 (35) = happyShift action_13
action_50 (4) = happyGoto action_61
action_50 (5) = happyGoto action_4
action_50 _ = happyFail

action_51 (28) = happyShift action_59
action_51 (37) = happyShift action_60
action_51 _ = happyFail

action_52 _ = happyReduce_25

action_53 _ = happyReduce_26

action_54 (15) = happyShift action_52
action_54 (16) = happyShift action_53
action_54 (25) = happyShift action_54
action_54 (6) = happyGoto action_58
action_54 _ = happyFail

action_55 _ = happyReduce_19

action_56 (15) = happyShift action_52
action_56 (16) = happyShift action_53
action_56 (25) = happyShift action_54
action_56 (6) = happyGoto action_57
action_56 _ = happyFail

action_57 (26) = happyShift action_66
action_57 (37) = happyShift action_60
action_57 _ = happyFail

action_58 (26) = happyShift action_65
action_58 (37) = happyShift action_60
action_58 _ = happyFail

action_59 (7) = happyShift action_2
action_59 (8) = happyShift action_5
action_59 (9) = happyShift action_6
action_59 (10) = happyShift action_7
action_59 (11) = happyShift action_8
action_59 (13) = happyShift action_9
action_59 (14) = happyShift action_10
action_59 (21) = happyShift action_11
action_59 (25) = happyShift action_12
action_59 (35) = happyShift action_13
action_59 (4) = happyGoto action_64
action_59 (5) = happyGoto action_4
action_59 _ = happyFail

action_60 (15) = happyShift action_52
action_60 (16) = happyShift action_53
action_60 (25) = happyShift action_54
action_60 (6) = happyGoto action_63
action_60 _ = happyFail

action_61 (20) = happyShift action_20
action_61 (21) = happyShift action_21
action_61 (22) = happyShift action_22
action_61 (23) = happyShift action_23
action_61 (24) = happyShift action_24
action_61 (27) = happyShift action_62
action_61 (29) = happyShift action_25
action_61 (30) = happyShift action_26
action_61 (31) = happyShift action_27
action_61 (32) = happyShift action_28
action_61 (33) = happyShift action_29
action_61 (34) = happyShift action_30
action_61 (36) = happyShift action_31
action_61 _ = happyFail

action_62 (12) = happyShift action_69
action_62 _ = happyFail

action_63 (37) = happyShift action_60
action_63 _ = happyReduce_27

action_64 (20) = happyShift action_20
action_64 (21) = happyShift action_21
action_64 (22) = happyShift action_22
action_64 (23) = happyShift action_23
action_64 (24) = happyShift action_24
action_64 (27) = happyShift action_68
action_64 (29) = happyShift action_25
action_64 (30) = happyShift action_26
action_64 (31) = happyShift action_27
action_64 (32) = happyShift action_28
action_64 (33) = happyShift action_29
action_64 (34) = happyShift action_30
action_64 (36) = happyShift action_31
action_64 _ = happyFail

action_65 _ = happyReduce_28

action_66 (18) = happyShift action_67
action_66 _ = happyFail

action_67 (7) = happyShift action_2
action_67 (8) = happyShift action_5
action_67 (9) = happyShift action_6
action_67 (10) = happyShift action_7
action_67 (11) = happyShift action_8
action_67 (13) = happyShift action_9
action_67 (14) = happyShift action_10
action_67 (21) = happyShift action_11
action_67 (25) = happyShift action_12
action_67 (35) = happyShift action_13
action_67 (4) = happyGoto action_72
action_67 (5) = happyGoto action_4
action_67 _ = happyFail

action_68 (7) = happyShift action_2
action_68 (8) = happyShift action_5
action_68 (9) = happyShift action_6
action_68 (10) = happyShift action_7
action_68 (11) = happyShift action_8
action_68 (13) = happyShift action_9
action_68 (14) = happyShift action_10
action_68 (21) = happyShift action_11
action_68 (25) = happyShift action_12
action_68 (35) = happyShift action_13
action_68 (4) = happyGoto action_71
action_68 (5) = happyGoto action_4
action_68 _ = happyFail

action_69 (7) = happyShift action_2
action_69 (8) = happyShift action_5
action_69 (9) = happyShift action_6
action_69 (10) = happyShift action_7
action_69 (11) = happyShift action_8
action_69 (13) = happyShift action_9
action_69 (14) = happyShift action_10
action_69 (21) = happyShift action_11
action_69 (25) = happyShift action_12
action_69 (35) = happyShift action_13
action_69 (4) = happyGoto action_70
action_69 (5) = happyGoto action_4
action_69 _ = happyFail

action_70 (20) = happyShift action_20
action_70 (21) = happyShift action_21
action_70 (22) = happyShift action_22
action_70 (23) = happyShift action_23
action_70 (24) = happyShift action_24
action_70 (29) = happyShift action_25
action_70 (30) = happyShift action_26
action_70 (31) = happyShift action_27
action_70 (32) = happyShift action_28
action_70 (33) = happyShift action_29
action_70 (34) = happyShift action_30
action_70 (36) = happyShift action_31
action_70 _ = happyReduce_3

action_71 (20) = happyShift action_20
action_71 (21) = happyShift action_21
action_71 (22) = happyShift action_22
action_71 (23) = happyShift action_23
action_71 (24) = happyShift action_24
action_71 (29) = happyShift action_25
action_71 (30) = happyShift action_26
action_71 (31) = happyShift action_27
action_71 (32) = happyShift action_28
action_71 (33) = happyShift action_29
action_71 (34) = happyShift action_30
action_71 (36) = happyShift action_31
action_71 _ = happyReduce_2

action_72 (19) = happyShift action_73
action_72 (20) = happyShift action_20
action_72 (21) = happyShift action_21
action_72 (22) = happyShift action_22
action_72 (23) = happyShift action_23
action_72 (24) = happyShift action_24
action_72 (29) = happyShift action_25
action_72 (30) = happyShift action_26
action_72 (31) = happyShift action_27
action_72 (32) = happyShift action_28
action_72 (33) = happyShift action_29
action_72 (34) = happyShift action_30
action_72 (36) = happyShift action_31
action_72 _ = happyFail

action_73 _ = happyReduce_1

happyReduce_1 = happyReduce 9 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdent happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Fun (happy_var_3, happy_var_5) happy_var_8
	) `HappyStk` happyRest

happyReduce_2 = happyReduce 8 4 happyReduction_2
happyReduction_2 ((HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdent happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Decl happy_var_2 happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_3 = happyReduce 8 4 happyReduction_3
happyReduction_3 ((HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If happy_var_3 happy_var_5 happy_var_8
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_3  4 happyReduction_4
happyReduction_4 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin Or happy_var_1 happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  4 happyReduction_5
happyReduction_5 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin And happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  4 happyReduction_6
happyReduction_6 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin EQ happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  4 happyReduction_7
happyReduction_7 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin LT happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  4 happyReduction_8
happyReduction_8 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin GT happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  4 happyReduction_9
happyReduction_9 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin LE happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  4 happyReduction_10
happyReduction_10 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin GE happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  4 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin Add happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  4 happyReduction_12
happyReduction_12 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin Sub happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  4 happyReduction_13
happyReduction_13 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin Mult happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  4 happyReduction_14
happyReduction_14 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin Div happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  4 happyReduction_15
happyReduction_15 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin Power happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  4 happyReduction_16
happyReduction_16 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Unary Neg happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  4 happyReduction_17
happyReduction_17 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Unary Not happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  4 happyReduction_18
happyReduction_18 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happyReduce 4 5 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Call happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_20 = happySpecReduce_1  5 happyReduction_20
happyReduction_20 (HappyTerminal (TokenIdent happy_var_1))
	 =  HappyAbsSyn5
		 (Var happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  5 happyReduction_21
happyReduction_21 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  5 happyReduction_22
happyReduction_22 (HappyTerminal (TokenDigits happy_var_1))
	 =  HappyAbsSyn5
		 (Lit (IntV happy_var_1)
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  5 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn5
		 (Lit (BoolV True)
	)

happyReduce_24 = happySpecReduce_1  5 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn5
		 (Lit (BoolV False)
	)

happyReduce_25 = happySpecReduce_1  6 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn6
		 (TInt
	)

happyReduce_26 = happySpecReduce_1  6 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn6
		 (TBool
	)

happyReduce_27 = happySpecReduce_3  6 happyReduction_27
happyReduction_27 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TFun happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  6 happyReduction_28
happyReduction_28 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 38 38 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenKeyword "function" -> cont 7;
	TokenKeyword "var" -> cont 8;
	TokenIdent happy_dollar_dollar -> cont 9;
	TokenDigits happy_dollar_dollar -> cont 10;
	TokenKeyword "if" -> cont 11;
	TokenKeyword "else" -> cont 12;
	TokenKeyword "true" -> cont 13;
	TokenKeyword "false" -> cont 14;
	TokenKeyword "Int" -> cont 15;
	TokenKeyword "Bool" -> cont 16;
	TokenSymbol ":" -> cont 17;
	TokenSymbol "{" -> cont 18;
	TokenSymbol "}" -> cont 19;
	TokenSymbol "+" -> cont 20;
	TokenSymbol "-" -> cont 21;
	TokenSymbol "*" -> cont 22;
	TokenSymbol "/" -> cont 23;
	TokenSymbol "^" -> cont 24;
	TokenSymbol "(" -> cont 25;
	TokenSymbol ")" -> cont 26;
	TokenSymbol ";" -> cont 27;
	TokenSymbol "=" -> cont 28;
	TokenSymbol "<" -> cont 29;
	TokenSymbol "<=" -> cont 30;
	TokenSymbol ">" -> cont 31;
	TokenSymbol ">=" -> cont 32;
	TokenSymbol "==" -> cont 33;
	TokenSymbol "&&" -> cont 34;
	TokenSymbol "!" -> cont 35;
	TokenSymbol "||" -> cont 36;
	TokenSymbol "->" -> cont 37;
	_ -> happyError' (tk:tks)
	}

happyError_ 38 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = return
    (<*>) = ap
instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [(Token)] -> HappyIdentity a
happyError' = HappyIdentity . parseError

parser tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error"

data Token
      = TokenDigits Int
      | TokenKeyword String
      | TokenSymbol String
      | TokenIdent String
      deriving Show

lexer :: [String] -> [String] -> String -> [Token]
lexer symbols keywords = lexer'
  where lexer' [] = []
        lexer' s@(c:cs)
          | isSpace c = lexer' cs
          | isDigit c = lexNum s
          | isAlpha c = lexVar s
          | otherwise = lexSym s symbols

        lexNum cs = TokenDigits (read num) : lexer' rest
          where (num, rest) = span isDigit cs

        lexVar cs = token : lexer' rest
          where (var, rest) = span isAlpha cs
                token = if var `elem` keywords
                        then TokenKeyword var
                        else TokenIdent var

        lexSym cs (s:ss) = case stripPrefix s cs of
                            Just rest -> TokenSymbol s : lexer' rest
                            Nothing -> lexSym cs ss
        lexSym cs [] = error $ "Cannot tokenize " ++ cs

symbols = ["->", "{", "}", "+", "-", "*", "/", "(", ")", ";", "==", "=", "<=", ">=", "<", ">", "||", "&&", "!", "^", ":"]
keywords = ["function", "var", "if", "else", "true", "false", "Bool", "Int"]

parseExpr = parser . lexer symbols keywords
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 16 "<built-in>" #-}
{-# LINE 1 "/Applications/ghc-7.10.1.app/Contents/lib/ghc-7.10.1/include/ghcversion.h" #-}


















{-# LINE 17 "<built-in>" #-}
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

