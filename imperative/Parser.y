{
module Parser (parseExpr) where
import Data.Char (isDigit, isSpace, isAlpha)
import Prelude hiding (LT, GT, EQ)
import Data.List (stripPrefix)
import Stateful
}


%name parser
%tokentype { Token }
%error { parseError }

%token
    fun     { TokenKeyword "function" }
    var     { TokenKeyword "var" }
    id      { TokenIdent $$ }
    digits  { TokenDigits $$ }
    if      { TokenKeyword "if" }
    else    { TokenKeyword "else" }
    true    { TokenKeyword "true" }
    false   { TokenKeyword "false" }
    mutable { TokenKeyword "mutable" }
    '{'     { TokenSymbol "{" }
    '}'     { TokenSymbol "}" }
    '+'     { TokenSymbol "+" }
    '-'     { TokenSymbol "-" }
    '*'     { TokenSymbol "*" }
    '/'     { TokenSymbol "/" }
    '^'     { TokenSymbol "^" }
    '('     { TokenSymbol "(" }
    ')'     { TokenSymbol ")" }
    ';'     { TokenSymbol ";" }
    '='     { TokenSymbol "=" }
    '<'     { TokenSymbol "<" }
    '<='    { TokenSymbol "<=" }
    '>'     { TokenSymbol ">" }
    '>='    { TokenSymbol ">=" }
    '=='    { TokenSymbol "==" }
    '&&'    { TokenSymbol "&&" }
    '!'     { TokenSymbol "!" }
    '||'    { TokenSymbol "||" }
    '@'    { TokenSymbol "@" }

%nonassoc '='
%left '||'
%left '&&'
%nonassoc '=='
%nonassoc '>' '<' '>=' '<='
%left '+' '-'
%left '*' '/'
%right '^'
%left NEG NOT AT MUTA

%%

Exp : fun '(' id ')' '{' Exp '}'                  { Fun $3 $6 }
    | var id '=' Exp ';' Exp                      { Decl $2 $4 $6 }
    | Exp ';' Exp   {Seq $1 $3}
    | if '(' Exp ')' '{' Exp '}' else '{' Exp '}' { If $3 $6 $10 }
    | Oper                                        { $1 }

Oper : Oper '=' Oper  {Assign $1 $3}
    | Oper '||' Oper                              { Bin Or $1 $3 }
    | Oper '&&' Oper                              { Bin And $1 $3 }
    | Oper '==' Oper                              { Bin EQ $1 $3 }
    | Oper '<' Oper                               { Bin LT $1 $3 }
    | Oper '>' Oper                               { Bin GT $1 $3 }
    | Oper '<=' Oper                              { Bin LE $1 $3 }
    | Oper '>=' Oper                              { Bin GE $1 $3 }
    | Oper '+' Oper                               { Bin Add $1 $3 }
    | Oper '-' Oper                               { Bin Sub $1 $3 }
    | Oper '*' Oper                               { Bin Mult $1 $3 }
    | Oper '/' Oper                               { Bin Div $1 $3 }
    | Oper '^' Oper                               { Bin Power $1 $3 }
    | '-' Oper %prec NEG                          { Unary Neg $2 }
    | '!' Oper %prec NOT                          { Unary Not $2 }
    | '@' Oper %prec AT   {Access $2}
    | mutable Oper %prec MUTA  {Mutable $2}
    | App                                         { $1 }

App : App '(' Exp ')'                             { Call $1 $3 }
    | id                                          { Var $1}
    | '(' Exp ')'                                 { $2 }
    | digits                                      { Lit (IntV $1) }
    | true                                        { Lit (BoolV True) }
    | false                                       { Lit (BoolV False) }

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

symbols = ["{", "}", "+", "-", "*", "/", "(", ")", ";", "==", "=", "<=", ">=", "<", ">", "||", "&&", "!", "^", "@"]
keywords = ["function", "var", "if", "else", "true", "false", "Bool", "Int", "mutable"]

parseExpr = parser . lexer symbols keywords

}
