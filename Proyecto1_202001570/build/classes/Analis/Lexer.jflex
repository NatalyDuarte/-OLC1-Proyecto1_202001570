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
letra = \^[a-zA-Z]\$
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
"/"             {return new Symbol(sym.DIVISION, yycolumn, yyline, yytext());}

"("             {return new Symbol(sym.PARENTESIS_A, yycolumn, yyline, yytext());}
")"             {return new Symbol(sym.PARENTESIS_C, yycolumn, yyline, yytext());}
"{"             {return new Symbol(sym.LLAVE_A, yycolumn, yyline, yytext());}
"}"             {return new Symbol(sym.LLAVE_C, yycolumn, yyline, yytext());}
"="             {return new Symbol(sym.IGUAL, yycolumn, yyline, yytext());}
        
";"             {return new Symbol(sym.PUNTOYCOMA, yycolumn, yyline, yytext());}

"mostrar"       {return new Symbol(sym.MOSTRAR, yycolumn, yyline, yytext());}
"if"            {return new Symbol(sym.IF, yycolumn, yyline, yytext());}
"int"            {return new Symbol(sym.INT, yycolumn, yyline, yytext());}
"double"            {return new Symbol(sym.DOUBLE, yycolumn, yyline, yytext());}
"char"            {return new Symbol(sym.CHAR, yycolumn, yyline, yytext());}
"bool"            {return new Symbol(sym.BOOL, yycolumn, yyline, yytext());}
"string"            {return new Symbol(sym.STRING, yycolumn, yyline, yytext());}
"true"            {return new Symbol(sym.TRUE, yycolumn, yyline, yytext());}
"false"            {return new Symbol(sym.FALSE, yycolumn, yyline, yytext());}

{entero}  { return new Symbol(sym.ENTERO, yycolumn, yyline, yytext()); }
{identificador}  { return new Symbol(sym.IDENTI, yycolumn, yyline, yytext()); }
{doublen}  { return new Symbol(sym.DOUBLEN, yycolumn, yyline, yytext()); }
{letra}  { return new Symbol(sym.LETRA, yycolumn, yyline, yytext()); }
{cadena}  { return new Symbol(sym.CADENA, yycolumn, yyline, yytext()); }
{comentariolinea}  { return new Symbol(sym.COMENLI, yycolumn, yyline, yytext()); }
{comentariomultilinea}  { return new Symbol(sym.COMENMULTILI, yycolumn, yyline, yytext()); }

//------> Ingorados 
[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}

//------> Errores Léxicos 
.           	{ System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); }
