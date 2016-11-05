{
module Parser (parseExpr) where
import Data.Char (isDigit, isSpace, isAlpha)
import Prelude hiding (LT, GT, EQ)
import Data.List (stripPrefix)
import Declare
}


%name parser
%tokentype { Token }
%error { parseError }

%token
    fun    { TokenKeyword "function" }
    var    { TokenKeyword "var" }
    id     { TokenIdent $$ }
    digits { TokenDigits $$ }
    if     { TokenKeyword "if" }
    else   { TokenKeyword "else" }
    true   { TokenKeyword "true" }
    false  { TokenKeyword "false" }
    Int    { TokenKeyword "Int" }
    Bool   { TokenKeyword "Bool" }
    ':'    { TokenSymbol ":" }
    '{'    { TokenSymbol "{" }
    '}'    { TokenSymbol "}" }
    '+'    { TokenSymbol "+" }
    '-'    { TokenSymbol "-" }
    '*'    { TokenSymbol "*" }
    '/'    { TokenSymbol "/" }
    '^'    { TokenSymbol "^" }
    '('    { TokenSymbol "(" }
    ')'    { TokenSymbol ")" }
    ';'    { TokenSymbol ";" }
    '='    { TokenSymbol "=" }
    '<'    { TokenSymbol "<" }
    '<='   { TokenSymbol "<=" }
    '>'    { TokenSymbol ">" }
    '>='   { TokenSymbol ">=" }
    '=='   { TokenSymbol "==" }
    '&&'   { TokenSymbol "&&" }
    '!'    { TokenSymbol "!" }
    '||'   { TokenSymbol "||" }
    '->'   { TokenSymbol "->" }

%right ';' else
%left '||'
%left '&&'
%nonassoc '=='
%nonassoc '>' '<' '>=' '<='
%left '+' '-'
%left '*' '/'
%right '^'
%left NEG NOT
%right '->'

%%

Exp : fun '(' id ':' typ ')' '{' Exp '}' { Fun ($3, $5) $8 }
    | var id ':' typ '=' Exp ';' Exp     { Decl $2 $4 $6 $8 }
    | if '(' Exp ')' Exp ';' else Exp    { If $3 $5 $8 }
    | Exp '||' Exp                       { Bin Or $1 $3 }
    | Exp '&&' Exp                       { Bin And $1 $3 }
    | Exp '==' Exp                       { Bin EQ $1 $3 }
    | Exp '<' Exp                        { Bin LT $1 $3 }
    | Exp '>' Exp                        { Bin GT $1 $3 }
    | Exp '<=' Exp                       { Bin LE $1 $3 }
    | Exp '>=' Exp                       { Bin GE $1 $3 }
    | Exp '+' Exp                        { Bin Add $1 $3 }
    | Exp '-' Exp                        { Bin Sub $1 $3 }
    | Exp '*' Exp                        { Bin Mult $1 $3 }
    | Exp '/' Exp                        { Bin Div $1 $3 }
    | Exp '^' Exp                        { Bin Power $1 $3 }
    | '-' Exp %prec NEG                  { Unary Neg $2 }
    | '!' Exp %prec NOT                  { Unary Not $2 }
    | App                                { $1 }

App : App '(' Exp ')'                    { Call $1 $3 }
    | id                                 { Var $1}
    | '(' Exp ')'                        { $2 }
    | digits                             { Lit (IntV $1) }
    | true                               { Lit (BoolV True) }
    | false                              { Lit (BoolV False) }

typ : Int                                { TInt }
    | Bool                               { TBool }
    | typ '->' typ                       { TFun $1 $3 }
    | '(' typ ')'                        { $2 }

{

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

}
