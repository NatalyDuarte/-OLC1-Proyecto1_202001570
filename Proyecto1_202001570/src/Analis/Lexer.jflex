// ------------  Paquete e importaciones ------------
package Analis; 

import java_cup.runtime.*;

%%	
//-------> Directivas (No tocar)

%public 
%class Lexer
%cup
%char
%column
%line
%unicode
%ignorecase

%{ 
%} 

// ------> Expresiones Regulares 
entero = [0-9]+
identificador = [a-zA-z][a-zA-z0-9_]*
doublen = [0-9]+(\.[0-9]+)?([eE][-+]?[0-9]+)?
cadena = \"(\\.|[^\"\\])*\"
FIN_LINEA = \r|\n|\r\n
INPUT = [^\r\n]
comentariolinea = \/+{INPUT}* {FIN_LINEA} ?
comentariomultilinea = \/\*[\s\S]*?\*\/

%%
// ------------  Reglas Lexicas -------------------

"*"             {return new Symbol(sym.POR, yycolumn, yyline, yytext());}
"+"             {return new Symbol(sym.MAS, yycolumn, yyline, yytext());}
"-"             {return new Symbol(sym.MENOS, yycolumn, yyline, yytext());}
" /"             {return new Symbol(sym.DIVISION, yycolumn, yyline, yytext());}

"("             {return new Symbol(sym.PARENTESIS_A, yycolumn, yyline, yytext());}
")"             {return new Symbol(sym.PARENTESIS_C, yycolumn, yyline, yytext());}
"{"             {return new Symbol(sym.LLAVE_A, yycolumn, yyline, yytext());}
"}"             {return new Symbol(sym.LLAVE_C, yycolumn, yyline, yytext());}
"="             {return new Symbol(sym.IGUAL, yycolumn, yyline, yytext());}
">"             {return new Symbol(sym.MAYOR, yycolumn, yyline, yytext());}
"<"             {return new Symbol(sym.MENOR, yycolumn, yyline, yytext());}
">="             {return new Symbol(sym.MAYORIGUAL, yycolumn, yyline, yytext());}
"<="             {return new Symbol(sym.MENORIGUAL, yycolumn, yyline, yytext());}
"=="             {return new Symbol(sym.IGUALIGUAL, yycolumn, yyline, yytext());}
":"             {return new Symbol(sym.DOSPUNTOS, yycolumn, yyline, yytext());}
        
";"             {return new Symbol(sym.PUNTOYCOMA, yycolumn, yyline, yytext());}

"console.write"       {return new Symbol(sym.MOSTRAR, yycolumn, yyline, yytext());}
"if"            {return new Symbol(sym.IF, yycolumn, yyline, yytext());}
"int"            {return new Symbol(sym.INT, yycolumn, yyline, yytext());}
"double"            {return new Symbol(sym.DOUBLE, yycolumn, yyline, yytext());}
"char"            {return new Symbol(sym.CHAR, yycolumn, yyline, yytext());}
"bool"            {return new Symbol(sym.BOOL, yycolumn, yyline, yytext());}
"string"            {return new Symbol(sym.STRING, yycolumn, yyline, yytext());}
"true"            {return new Symbol(sym.TRUE, yycolumn, yyline, yytext());}
"false"            {return new Symbol(sym.FALSE, yycolumn, yyline, yytext());}
"void"            {return new Symbol(sym.VOID, yycolumn, yyline, yytext());}
"main"            {return new Symbol(sym.MAIN, yycolumn, yyline, yytext());}
"else"            {return new Symbol(sym.ELSE, yycolumn, yyline, yytext());}
"for"            {return new Symbol(sym.FOR, yycolumn, yyline, yytext());}
"while"            {return new Symbol(sym.WHILE, yycolumn, yyline, yytext());}
"switch"            {return new Symbol(sym.SWITCH, yycolumn, yyline, yytext());}
"case"            {return new Symbol(sym.CASE, yycolumn, yyline, yytext());}
"break"            {return new Symbol(sym.BREAK, yycolumn, yyline, yytext());}
"default"            {return new Symbol(sym.DEFAULT, yycolumn, yyline, yytext());}
"do"            {return new Symbol(sym.DO, yycolumn, yyline, yytext());}


"0"            {return new Symbol(sym.CERO, yycolumn, yyline, yytext());}
"&&"            {return new Symbol(sym.AND, yycolumn, yyline, yytext());}
"||"            {return new Symbol(sym.OR, yycolumn, yyline, yytext());}
" !"            {return new Symbol(sym.NOT, yycolumn, yyline, yytext());}

{entero}  { return new Symbol(sym.ENTERO, yycolumn, yyline, yytext()); }
{identificador}  { return new Symbol(sym.IDENTI, yycolumn, yyline, yytext()); }
{doublen}  { return new Symbol(sym.DOUBLEN, yycolumn, yyline, yytext()); }
{cadena}  { return new Symbol(sym.CADENA, yycolumn, yyline, yytext()); }
{comentariolinea}  { return new Symbol(sym.COMENLI, yycolumn, yyline, yytext()); }
{comentariomultilinea}  { return new Symbol(sym.COMENMULTILI, yycolumn, yyline, yytext()); }

//------> Ingorados 
[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}

//------> Errores Léxicos 
.           	{ System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); }
