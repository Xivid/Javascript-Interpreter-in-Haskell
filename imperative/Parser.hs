{-# OPTIONS_GHC -w #-}
module Parser (parseExpr) where
import Data.Char (isDigit, isSpace, isAlpha)
import Prelude hiding (LT, GT, EQ)
import Data.List (stripPrefix)
import Stateful
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
action_0 (8) = happyShift action_6
action_0 (9) = happyShift action_7
action_0 (10) = happyShift action_8
action_0 (11) = happyShift action_9
action_0 (13) = happyShift action_10
action_0 (14) = happyShift action_11
action_0 (15) = happyShift action_12
action_0 (19) = happyShift action_13
action_0 (23) = happyShift action_14
action_0 (33) = happyShift action_15
action_0 (35) = happyShift action_16
action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_4
action_0 (6) = happyGoto action_5
action_0 _ = happyFail

action_1 (7) = happyShift action_2
action_1 _ = happyFail

action_2 (23) = happyShift action_39
action_2 _ = happyFail

action_3 (25) = happyShift action_38
action_3 (36) = happyAccept
action_3 _ = happyFail

action_4 (18) = happyShift action_25
action_4 (19) = happyShift action_26
action_4 (20) = happyShift action_27
action_4 (21) = happyShift action_28
action_4 (22) = happyShift action_29
action_4 (26) = happyShift action_30
action_4 (27) = happyShift action_31
action_4 (28) = happyShift action_32
action_4 (29) = happyShift action_33
action_4 (30) = happyShift action_34
action_4 (31) = happyShift action_35
action_4 (32) = happyShift action_36
action_4 (34) = happyShift action_37
action_4 _ = happyReduce_5

action_5 (23) = happyShift action_24
action_5 _ = happyReduce_23

action_6 (9) = happyShift action_23
action_6 _ = happyFail

action_7 _ = happyReduce_25

action_8 _ = happyReduce_27

action_9 (23) = happyShift action_22
action_9 _ = happyFail

action_10 _ = happyReduce_28

action_11 _ = happyReduce_29

action_12 (9) = happyShift action_7
action_12 (10) = happyShift action_8
action_12 (13) = happyShift action_10
action_12 (14) = happyShift action_11
action_12 (15) = happyShift action_12
action_12 (19) = happyShift action_13
action_12 (23) = happyShift action_14
action_12 (33) = happyShift action_15
action_12 (35) = happyShift action_16
action_12 (5) = happyGoto action_21
action_12 (6) = happyGoto action_5
action_12 _ = happyFail

action_13 (9) = happyShift action_7
action_13 (10) = happyShift action_8
action_13 (13) = happyShift action_10
action_13 (14) = happyShift action_11
action_13 (15) = happyShift action_12
action_13 (19) = happyShift action_13
action_13 (23) = happyShift action_14
action_13 (33) = happyShift action_15
action_13 (35) = happyShift action_16
action_13 (5) = happyGoto action_20
action_13 (6) = happyGoto action_5
action_13 _ = happyFail

action_14 (7) = happyShift action_2
action_14 (8) = happyShift action_6
action_14 (9) = happyShift action_7
action_14 (10) = happyShift action_8
action_14 (11) = happyShift action_9
action_14 (13) = happyShift action_10
action_14 (14) = happyShift action_11
action_14 (15) = happyShift action_12
action_14 (19) = happyShift action_13
action_14 (23) = happyShift action_14
action_14 (33) = happyShift action_15
action_14 (35) = happyShift action_16
action_14 (4) = happyGoto action_19
action_14 (5) = happyGoto action_4
action_14 (6) = happyGoto action_5
action_14 _ = happyFail

action_15 (9) = happyShift action_7
action_15 (10) = happyShift action_8
action_15 (13) = happyShift action_10
action_15 (14) = happyShift action_11
action_15 (15) = happyShift action_12
action_15 (19) = happyShift action_13
action_15 (23) = happyShift action_14
action_15 (33) = happyShift action_15
action_15 (35) = happyShift action_16
action_15 (5) = happyGoto action_18
action_15 (6) = happyGoto action_5
action_15 _ = happyFail

action_16 (9) = happyShift action_7
action_16 (10) = happyShift action_8
action_16 (13) = happyShift action_10
action_16 (14) = happyShift action_11
action_16 (15) = happyShift action_12
action_16 (19) = happyShift action_13
action_16 (23) = happyShift action_14
action_16 (33) = happyShift action_15
action_16 (35) = happyShift action_16
action_16 (5) = happyGoto action_17
action_16 (6) = happyGoto action_5
action_16 _ = happyFail

action_17 _ = happyReduce_21

action_18 _ = happyReduce_20

action_19 (24) = happyShift action_58
action_19 (25) = happyShift action_38
action_19 _ = happyFail

action_20 _ = happyReduce_19

action_21 _ = happyReduce_22

action_22 (7) = happyShift action_2
action_22 (8) = happyShift action_6
action_22 (9) = happyShift action_7
action_22 (10) = happyShift action_8
action_22 (11) = happyShift action_9
action_22 (13) = happyShift action_10
action_22 (14) = happyShift action_11
action_22 (15) = happyShift action_12
action_22 (19) = happyShift action_13
action_22 (23) = happyShift action_14
action_22 (33) = happyShift action_15
action_22 (35) = happyShift action_16
action_22 (4) = happyGoto action_57
action_22 (5) = happyGoto action_4
action_22 (6) = happyGoto action_5
action_22 _ = happyFail

action_23 (26) = happyShift action_56
action_23 _ = happyFail

action_24 (7) = happyShift action_2
action_24 (8) = happyShift action_6
action_24 (9) = happyShift action_7
action_24 (10) = happyShift action_8
action_24 (11) = happyShift action_9
action_24 (13) = happyShift action_10
action_24 (14) = happyShift action_11
action_24 (15) = happyShift action_12
action_24 (19) = happyShift action_13
action_24 (23) = happyShift action_14
action_24 (33) = happyShift action_15
action_24 (35) = happyShift action_16
action_24 (4) = happyGoto action_55
action_24 (5) = happyGoto action_4
action_24 (6) = happyGoto action_5
action_24 _ = happyFail

action_25 (9) = happyShift action_7
action_25 (10) = happyShift action_8
action_25 (13) = happyShift action_10
action_25 (14) = happyShift action_11
action_25 (15) = happyShift action_12
action_25 (19) = happyShift action_13
action_25 (23) = happyShift action_14
action_25 (33) = happyShift action_15
action_25 (35) = happyShift action_16
action_25 (5) = happyGoto action_54
action_25 (6) = happyGoto action_5
action_25 _ = happyFail

action_26 (9) = happyShift action_7
action_26 (10) = happyShift action_8
action_26 (13) = happyShift action_10
action_26 (14) = happyShift action_11
action_26 (15) = happyShift action_12
action_26 (19) = happyShift action_13
action_26 (23) = happyShift action_14
action_26 (33) = happyShift action_15
action_26 (35) = happyShift action_16
action_26 (5) = happyGoto action_53
action_26 (6) = happyGoto action_5
action_26 _ = happyFail

action_27 (9) = happyShift action_7
action_27 (10) = happyShift action_8
action_27 (13) = happyShift action_10
action_27 (14) = happyShift action_11
action_27 (15) = happyShift action_12
action_27 (19) = happyShift action_13
action_27 (23) = happyShift action_14
action_27 (33) = happyShift action_15
action_27 (35) = happyShift action_16
action_27 (5) = happyGoto action_52
action_27 (6) = happyGoto action_5
action_27 _ = happyFail

action_28 (9) = happyShift action_7
action_28 (10) = happyShift action_8
action_28 (13) = happyShift action_10
action_28 (14) = happyShift action_11
action_28 (15) = happyShift action_12
action_28 (19) = happyShift action_13
action_28 (23) = happyShift action_14
action_28 (33) = happyShift action_15
action_28 (35) = happyShift action_16
action_28 (5) = happyGoto action_51
action_28 (6) = happyGoto action_5
action_28 _ = happyFail

action_29 (9) = happyShift action_7
action_29 (10) = happyShift action_8
action_29 (13) = happyShift action_10
action_29 (14) = happyShift action_11
action_29 (15) = happyShift action_12
action_29 (19) = happyShift action_13
action_29 (23) = happyShift action_14
action_29 (33) = happyShift action_15
action_29 (35) = happyShift action_16
action_29 (5) = happyGoto action_50
action_29 (6) = happyGoto action_5
action_29 _ = happyFail

action_30 (9) = happyShift action_7
action_30 (10) = happyShift action_8
action_30 (13) = happyShift action_10
action_30 (14) = happyShift action_11
action_30 (15) = happyShift action_12
action_30 (19) = happyShift action_13
action_30 (23) = happyShift action_14
action_30 (33) = happyShift action_15
action_30 (35) = happyShift action_16
action_30 (5) = happyGoto action_49
action_30 (6) = happyGoto action_5
action_30 _ = happyFail

action_31 (9) = happyShift action_7
action_31 (10) = happyShift action_8
action_31 (13) = happyShift action_10
action_31 (14) = happyShift action_11
action_31 (15) = happyShift action_12
action_31 (19) = happyShift action_13
action_31 (23) = happyShift action_14
action_31 (33) = happyShift action_15
action_31 (35) = happyShift action_16
action_31 (5) = happyGoto action_48
action_31 (6) = happyGoto action_5
action_31 _ = happyFail

action_32 (9) = happyShift action_7
action_32 (10) = happyShift action_8
action_32 (13) = happyShift action_10
action_32 (14) = happyShift action_11
action_32 (15) = happyShift action_12
action_32 (19) = happyShift action_13
action_32 (23) = happyShift action_14
action_32 (33) = happyShift action_15
action_32 (35) = happyShift action_16
action_32 (5) = happyGoto action_47
action_32 (6) = happyGoto action_5
action_32 _ = happyFail

action_33 (9) = happyShift action_7
action_33 (10) = happyShift action_8
action_33 (13) = happyShift action_10
action_33 (14) = happyShift action_11
action_33 (15) = happyShift action_12
action_33 (19) = happyShift action_13
action_33 (23) = happyShift action_14
action_33 (33) = happyShift action_15
action_33 (35) = happyShift action_16
action_33 (5) = happyGoto action_46
action_33 (6) = happyGoto action_5
action_33 _ = happyFail

action_34 (9) = happyShift action_7
action_34 (10) = happyShift action_8
action_34 (13) = happyShift action_10
action_34 (14) = happyShift action_11
action_34 (15) = happyShift action_12
action_34 (19) = happyShift action_13
action_34 (23) = happyShift action_14
action_34 (33) = happyShift action_15
action_34 (35) = happyShift action_16
action_34 (5) = happyGoto action_45
action_34 (6) = happyGoto action_5
action_34 _ = happyFail

action_35 (9) = happyShift action_7
action_35 (10) = happyShift action_8
action_35 (13) = happyShift action_10
action_35 (14) = happyShift action_11
action_35 (15) = happyShift action_12
action_35 (19) = happyShift action_13
action_35 (23) = happyShift action_14
action_35 (33) = happyShift action_15
action_35 (35) = happyShift action_16
action_35 (5) = happyGoto action_44
action_35 (6) = happyGoto action_5
action_35 _ = happyFail

action_36 (9) = happyShift action_7
action_36 (10) = happyShift action_8
action_36 (13) = happyShift action_10
action_36 (14) = happyShift action_11
action_36 (15) = happyShift action_12
action_36 (19) = happyShift action_13
action_36 (23) = happyShift action_14
action_36 (33) = happyShift action_15
action_36 (35) = happyShift action_16
action_36 (5) = happyGoto action_43
action_36 (6) = happyGoto action_5
action_36 _ = happyFail

action_37 (9) = happyShift action_7
action_37 (10) = happyShift action_8
action_37 (13) = happyShift action_10
action_37 (14) = happyShift action_11
action_37 (15) = happyShift action_12
action_37 (19) = happyShift action_13
action_37 (23) = happyShift action_14
action_37 (33) = happyShift action_15
action_37 (35) = happyShift action_16
action_37 (5) = happyGoto action_42
action_37 (6) = happyGoto action_5
action_37 _ = happyFail

action_38 (7) = happyShift action_2
action_38 (8) = happyShift action_6
action_38 (9) = happyShift action_7
action_38 (10) = happyShift action_8
action_38 (11) = happyShift action_9
action_38 (13) = happyShift action_10
action_38 (14) = happyShift action_11
action_38 (15) = happyShift action_12
action_38 (19) = happyShift action_13
action_38 (23) = happyShift action_14
action_38 (33) = happyShift action_15
action_38 (35) = happyShift action_16
action_38 (4) = happyGoto action_41
action_38 (5) = happyGoto action_4
action_38 (6) = happyGoto action_5
action_38 _ = happyFail

action_39 (9) = happyShift action_40
action_39 _ = happyFail

action_40 (24) = happyShift action_62
action_40 _ = happyFail

action_41 (25) = happyShift action_38
action_41 _ = happyReduce_3

action_42 (18) = happyShift action_25
action_42 (19) = happyShift action_26
action_42 (20) = happyShift action_27
action_42 (21) = happyShift action_28
action_42 (22) = happyShift action_29
action_42 (27) = happyShift action_31
action_42 (28) = happyShift action_32
action_42 (29) = happyShift action_33
action_42 (30) = happyShift action_34
action_42 (31) = happyShift action_35
action_42 (32) = happyShift action_36
action_42 _ = happyReduce_7

action_43 (18) = happyShift action_25
action_43 (19) = happyShift action_26
action_43 (20) = happyShift action_27
action_43 (21) = happyShift action_28
action_43 (22) = happyShift action_29
action_43 (27) = happyShift action_31
action_43 (28) = happyShift action_32
action_43 (29) = happyShift action_33
action_43 (30) = happyShift action_34
action_43 (31) = happyShift action_35
action_43 _ = happyReduce_8

action_44 (18) = happyShift action_25
action_44 (19) = happyShift action_26
action_44 (20) = happyShift action_27
action_44 (21) = happyShift action_28
action_44 (22) = happyShift action_29
action_44 (27) = happyShift action_31
action_44 (28) = happyShift action_32
action_44 (29) = happyShift action_33
action_44 (30) = happyShift action_34
action_44 (31) = happyFail
action_44 _ = happyReduce_9

action_45 (18) = happyShift action_25
action_45 (19) = happyShift action_26
action_45 (20) = happyShift action_27
action_45 (21) = happyShift action_28
action_45 (22) = happyShift action_29
action_45 (27) = happyFail
action_45 (28) = happyFail
action_45 (29) = happyFail
action_45 (30) = happyFail
action_45 _ = happyReduce_13

action_46 (18) = happyShift action_25
action_46 (19) = happyShift action_26
action_46 (20) = happyShift action_27
action_46 (21) = happyShift action_28
action_46 (22) = happyShift action_29
action_46 (27) = happyFail
action_46 (28) = happyFail
action_46 (29) = happyFail
action_46 (30) = happyFail
action_46 _ = happyReduce_11

action_47 (18) = happyShift action_25
action_47 (19) = happyShift action_26
action_47 (20) = happyShift action_27
action_47 (21) = happyShift action_28
action_47 (22) = happyShift action_29
action_47 (27) = happyFail
action_47 (28) = happyFail
action_47 (29) = happyFail
action_47 (30) = happyFail
action_47 _ = happyReduce_12

action_48 (18) = happyShift action_25
action_48 (19) = happyShift action_26
action_48 (20) = happyShift action_27
action_48 (21) = happyShift action_28
action_48 (22) = happyShift action_29
action_48 (27) = happyFail
action_48 (28) = happyFail
action_48 (29) = happyFail
action_48 (30) = happyFail
action_48 _ = happyReduce_10

action_49 (18) = happyShift action_25
action_49 (19) = happyShift action_26
action_49 (20) = happyShift action_27
action_49 (21) = happyShift action_28
action_49 (22) = happyShift action_29
action_49 (26) = happyFail
action_49 (27) = happyShift action_31
action_49 (28) = happyShift action_32
action_49 (29) = happyShift action_33
action_49 (30) = happyShift action_34
action_49 (31) = happyShift action_35
action_49 (32) = happyShift action_36
action_49 (34) = happyShift action_37
action_49 _ = happyReduce_6

action_50 (22) = happyShift action_29
action_50 _ = happyReduce_18

action_51 (22) = happyShift action_29
action_51 _ = happyReduce_17

action_52 (22) = happyShift action_29
action_52 _ = happyReduce_16

action_53 (20) = happyShift action_27
action_53 (21) = happyShift action_28
action_53 (22) = happyShift action_29
action_53 _ = happyReduce_15

action_54 (20) = happyShift action_27
action_54 (21) = happyShift action_28
action_54 (22) = happyShift action_29
action_54 _ = happyReduce_14

action_55 (24) = happyShift action_61
action_55 (25) = happyShift action_38
action_55 _ = happyFail

action_56 (7) = happyShift action_2
action_56 (8) = happyShift action_6
action_56 (9) = happyShift action_7
action_56 (10) = happyShift action_8
action_56 (11) = happyShift action_9
action_56 (13) = happyShift action_10
action_56 (14) = happyShift action_11
action_56 (15) = happyShift action_12
action_56 (19) = happyShift action_13
action_56 (23) = happyShift action_14
action_56 (33) = happyShift action_15
action_56 (35) = happyShift action_16
action_56 (4) = happyGoto action_60
action_56 (5) = happyGoto action_4
action_56 (6) = happyGoto action_5
action_56 _ = happyFail

action_57 (24) = happyShift action_59
action_57 (25) = happyShift action_38
action_57 _ = happyFail

action_58 _ = happyReduce_26

action_59 (16) = happyShift action_65
action_59 _ = happyFail

action_60 (25) = happyShift action_64
action_60 _ = happyFail

action_61 _ = happyReduce_24

action_62 (16) = happyShift action_63
action_62 _ = happyFail

action_63 (7) = happyShift action_2
action_63 (8) = happyShift action_6
action_63 (9) = happyShift action_7
action_63 (10) = happyShift action_8
action_63 (11) = happyShift action_9
action_63 (13) = happyShift action_10
action_63 (14) = happyShift action_11
action_63 (15) = happyShift action_12
action_63 (19) = happyShift action_13
action_63 (23) = happyShift action_14
action_63 (33) = happyShift action_15
action_63 (35) = happyShift action_16
action_63 (4) = happyGoto action_68
action_63 (5) = happyGoto action_4
action_63 (6) = happyGoto action_5
action_63 _ = happyFail

action_64 (7) = happyShift action_2
action_64 (8) = happyShift action_6
action_64 (9) = happyShift action_7
action_64 (10) = happyShift action_8
action_64 (11) = happyShift action_9
action_64 (13) = happyShift action_10
action_64 (14) = happyShift action_11
action_64 (15) = happyShift action_12
action_64 (19) = happyShift action_13
action_64 (23) = happyShift action_14
action_64 (33) = happyShift action_15
action_64 (35) = happyShift action_16
action_64 (4) = happyGoto action_67
action_64 (5) = happyGoto action_4
action_64 (6) = happyGoto action_5
action_64 _ = happyFail

action_65 (7) = happyShift action_2
action_65 (8) = happyShift action_6
action_65 (9) = happyShift action_7
action_65 (10) = happyShift action_8
action_65 (11) = happyShift action_9
action_65 (13) = happyShift action_10
action_65 (14) = happyShift action_11
action_65 (15) = happyShift action_12
action_65 (19) = happyShift action_13
action_65 (23) = happyShift action_14
action_65 (33) = happyShift action_15
action_65 (35) = happyShift action_16
action_65 (4) = happyGoto action_66
action_65 (5) = happyGoto action_4
action_65 (6) = happyGoto action_5
action_65 _ = happyFail

action_66 (17) = happyShift action_70
action_66 (25) = happyShift action_38
action_66 _ = happyFail

action_67 (25) = happyShift action_38
action_67 _ = happyReduce_2

action_68 (17) = happyShift action_69
action_68 (25) = happyShift action_38
action_68 _ = happyFail

action_69 _ = happyReduce_1

action_70 (12) = happyShift action_71
action_70 _ = happyFail

action_71 (16) = happyShift action_72
action_71 _ = happyFail

action_72 (7) = happyShift action_2
action_72 (8) = happyShift action_6
action_72 (9) = happyShift action_7
action_72 (10) = happyShift action_8
action_72 (11) = happyShift action_9
action_72 (13) = happyShift action_10
action_72 (14) = happyShift action_11
action_72 (15) = happyShift action_12
action_72 (19) = happyShift action_13
action_72 (23) = happyShift action_14
action_72 (33) = happyShift action_15
action_72 (35) = happyShift action_16
action_72 (4) = happyGoto action_73
action_72 (5) = happyGoto action_4
action_72 (6) = happyGoto action_5
action_72 _ = happyFail

action_73 (17) = happyShift action_74
action_73 (25) = happyShift action_38
action_73 _ = happyFail

action_74 _ = happyReduce_4

happyReduce_1 = happyReduce 7 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdent happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Fun happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_2 = happyReduce 6 4 happyReduction_2
happyReduction_2 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdent happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Decl happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_3 = happySpecReduce_3  4 happyReduction_3
happyReduction_3 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Seq happy_var_1 happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happyReduce 11 4 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If happy_var_3 happy_var_6 happy_var_10
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_1  4 happyReduction_5
happyReduction_5 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  5 happyReduction_6
happyReduction_6 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Assign happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  5 happyReduction_7
happyReduction_7 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Bin Or happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  5 happyReduction_8
happyReduction_8 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Bin And happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  5 happyReduction_9
happyReduction_9 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Bin EQ happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  5 happyReduction_10
happyReduction_10 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Bin LT happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  5 happyReduction_11
happyReduction_11 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Bin GT happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  5 happyReduction_12
happyReduction_12 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Bin LE happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  5 happyReduction_13
happyReduction_13 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Bin GE happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  5 happyReduction_14
happyReduction_14 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Bin Add happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  5 happyReduction_15
happyReduction_15 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Bin Sub happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  5 happyReduction_16
happyReduction_16 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Bin Mult happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  5 happyReduction_17
happyReduction_17 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Bin Div happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  5 happyReduction_18
happyReduction_18 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Bin Power happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  5 happyReduction_19
happyReduction_19 (HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Unary Neg happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  5 happyReduction_20
happyReduction_20 (HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Unary Not happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  5 happyReduction_21
happyReduction_21 (HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Access happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_2  5 happyReduction_22
happyReduction_22 (HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Mutable happy_var_2
	)
happyReduction_22 _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  5 happyReduction_23
happyReduction_23 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happyReduce 4 6 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Call happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_1  6 happyReduction_25
happyReduction_25 (HappyTerminal (TokenIdent happy_var_1))
	 =  HappyAbsSyn6
		 (Var happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  6 happyReduction_26
happyReduction_26 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  6 happyReduction_27
happyReduction_27 (HappyTerminal (TokenDigits happy_var_1))
	 =  HappyAbsSyn6
		 (Lit (IntV happy_var_1)
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  6 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn6
		 (Lit (BoolV True)
	)

happyReduce_29 = happySpecReduce_1  6 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn6
		 (Lit (BoolV False)
	)

happyNewToken action sts stk [] =
	action 36 36 notHappyAtAll (HappyState action) sts stk []

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
	TokenKeyword "mutable" -> cont 15;
	TokenSymbol "{" -> cont 16;
	TokenSymbol "}" -> cont 17;
	TokenSymbol "+" -> cont 18;
	TokenSymbol "-" -> cont 19;
	TokenSymbol "*" -> cont 20;
	TokenSymbol "/" -> cont 21;
	TokenSymbol "^" -> cont 22;
	TokenSymbol "(" -> cont 23;
	TokenSymbol ")" -> cont 24;
	TokenSymbol ";" -> cont 25;
	TokenSymbol "=" -> cont 26;
	TokenSymbol "<" -> cont 27;
	TokenSymbol "<=" -> cont 28;
	TokenSymbol ">" -> cont 29;
	TokenSymbol ">=" -> cont 30;
	TokenSymbol "==" -> cont 31;
	TokenSymbol "&&" -> cont 32;
	TokenSymbol "!" -> cont 33;
	TokenSymbol "||" -> cont 34;
	TokenSymbol "@" -> cont 35;
	_ -> happyError' (tk:tks)
	}

happyError_ 36 tk tks = happyError' tks
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

symbols = ["{", "}", "+", "-", "*", "/", "(", ")", ";", "==", "=", "<=", ">=", "<", ">", "||", "&&", "!", "^", "@"]
keywords = ["function", "var", "if", "else", "true", "false", "Bool", "Int", "mutable"]

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

