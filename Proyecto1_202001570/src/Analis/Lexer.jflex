// ------------  Paquete e importaciones ------------
package Analis; 

import java_cup.runtime.*;
import java.util.LinkedList;
import Principal.*;

%%	
//-------> Directivas (No tocar)
%{
    public void AgregarError(String tipo, String lexema, int fila, int columna) {
        TError nuevoError = new TError(tipo, lexema, fila, columna);
        Principal.Lista_Errores.add(nuevoError);
        Principal.Des_Error.add("");
    }
    public void AgregarToken(String lexema, String token, int fila, int columna) {
        Tokens nuevo= new Tokens( lexema,token, fila, columna);
        Principal.Lista_Tokens.add(nuevo);
    }
%}
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

"*"             {AgregarToken( yytext(),"POR",yyline, yycolumn);return new Symbol(sym.POR, yycolumn, yyline, yytext());}
"+"             {AgregarToken( yytext(),"MAS",yyline, yycolumn);return new Symbol(sym.MAS, yycolumn, yyline, yytext());}
"-"             {AgregarToken( yytext(),"MENOS",yyline, yycolumn);return new Symbol(sym.MENOS, yycolumn, yyline, yytext());}
" /"            {AgregarToken( yytext(),"DIVISION",yyline, yycolumn);return new Symbol(sym.DIVISION, yycolumn, yyline, yytext());}

"\[\]"          {AgregarToken( yytext(),"CORCHETE",yyline, yycolumn);return new Symbol(sym.CORCHETE, yycolumn, yyline, yytext());}
"("             {AgregarToken( yytext(),"PARENTESIS_A",yyline, yycolumn);return new Symbol(sym.PARENTESIS_A, yycolumn, yyline, yytext());}
")"             {AgregarToken( yytext(),"PARENTESIS_C",yyline, yycolumn);return new Symbol(sym.PARENTESIS_C, yycolumn, yyline, yytext());}
"{"             {AgregarToken( yytext(),"LLAVE_A",yyline, yycolumn);return new Symbol(sym.LLAVE_A, yycolumn, yyline, yytext());}
"}"             {AgregarToken( yytext(),"LLAVE_C",yyline, yycolumn);return new Symbol(sym.LLAVE_C, yycolumn, yyline, yytext());}
"="             {AgregarToken( yytext(),"IGUAL",yyline, yycolumn);return new Symbol(sym.IGUAL, yycolumn, yyline, yytext());}
">"             {AgregarToken( yytext(),"MAYOR",yyline, yycolumn);return new Symbol(sym.MAYOR, yycolumn, yyline, yytext());}
"<"             {AgregarToken( yytext(),"MENOR",yyline, yycolumn);return new Symbol(sym.MENOR, yycolumn, yyline, yytext());}
">="            {AgregarToken( yytext(),"MAYORIGUAL",yyline, yycolumn);return new Symbol(sym.MAYORIGUAL, yycolumn, yyline, yytext());}
"<="            {AgregarToken( yytext(),"MENORIGUAL",yyline, yycolumn);return new Symbol(sym.MENORIGUAL, yycolumn, yyline, yytext());}
"=="            {AgregarToken( yytext(),"IGUALIGUAL",yyline, yycolumn);return new Symbol(sym.IGUALIGUAL, yycolumn, yyline, yytext());}
":"             {AgregarToken( yytext(),"DOSPUNTOS",yyline, yycolumn);return new Symbol(sym.DOSPUNTOS, yycolumn, yyline, yytext());}
        
";"             {AgregarToken( yytext(),"PUNTOYCOMA",yyline, yycolumn);return new Symbol(sym.PUNTOYCOMA, yycolumn, yyline, yytext());}
","             {AgregarToken( yytext(),"COMA",yyline, yycolumn);return new Symbol(sym.COMA, yycolumn, yyline, yytext());}

"console.write"       {AgregarToken( yytext(),"PRINT",yyline, yycolumn);return new Symbol(sym.MOSTRAR, yycolumn, yyline, yytext());}
"if"                  {AgregarToken( yytext(),"IF",yyline, yycolumn);return new Symbol(sym.IF, yycolumn, yyline, yytext());}
"int"                 {AgregarToken( yytext(),"INT",yyline, yycolumn);return new Symbol(sym.INT, yycolumn, yyline, yytext());}
"double"              {AgregarToken( yytext(),"DOUBLE",yyline, yycolumn);return new Symbol(sym.DOUBLE, yycolumn, yyline, yytext());}
"char"                {AgregarToken( yytext(),"CHAR",yyline, yycolumn);return new Symbol(sym.CHAR, yycolumn, yyline, yytext());}
"bool"                {AgregarToken( yytext(),"BOOL",yyline, yycolumn);return new Symbol(sym.BOOL, yycolumn, yyline, yytext());}
"string"              {AgregarToken( yytext(),"STRING",yyline, yycolumn);return new Symbol(sym.STRING, yycolumn, yyline, yytext());}
"true"                {AgregarToken( yytext(),"TRUE",yyline, yycolumn);return new Symbol(sym.TRUE, yycolumn, yyline, yytext());}
"false"               {AgregarToken( yytext(),"FALSE",yyline, yycolumn);return new Symbol(sym.FALSE, yycolumn, yyline, yytext());}
"void"                {AgregarToken( yytext(),"VOID",yyline, yycolumn);return new Symbol(sym.VOID, yycolumn, yyline, yytext());}
"main"                {AgregarToken( yytext(),"MAIN",yyline, yycolumn);return new Symbol(sym.MAIN, yycolumn, yyline, yytext());}
"else"                {AgregarToken( yytext(),"ELSE",yyline, yycolumn);return new Symbol(sym.ELSE, yycolumn, yyline, yytext());}
"for"                 {AgregarToken( yytext(),"FOR",yyline, yycolumn);return new Symbol(sym.FOR, yycolumn, yyline, yytext());}
"while"               {AgregarToken( yytext(),"WHILE",yyline, yycolumn);return new Symbol(sym.WHILE, yycolumn, yyline, yytext());}
"switch"              {AgregarToken( yytext(),"SWITCH",yyline, yycolumn);return new Symbol(sym.SWITCH, yycolumn, yyline, yytext());}
"case"                {AgregarToken( yytext(),"CASE",yyline, yycolumn);return new Symbol(sym.CASE, yycolumn, yyline, yytext());}
"break"               {AgregarToken( yytext(),"BREAK",yyline, yycolumn);return new Symbol(sym.BREAK, yycolumn, yyline, yytext());}
"default"             {AgregarToken( yytext(),"DEFAULT",yyline, yycolumn);return new Symbol(sym.DEFAULT, yycolumn, yyline, yytext());}
"do"                  {AgregarToken( yytext(),"DO",yyline, yycolumn);return new Symbol(sym.DO, yycolumn, yyline, yytext());}
"definirglobales"     {AgregarToken( yytext(),"DEFIGLO",yyline, yycolumn);return new Symbol(sym.DEFIGLO, yycolumn, yyline, yytext());}
"newvalor"            {AgregarToken( yytext(),"NEWVALOR",yyline, yycolumn);return new Symbol(sym.NEWVALOR, yycolumn, yyline, yytext());}
"graficabarras"       {AgregarToken( yytext(),"GRAFIB",yyline, yycolumn);return new Symbol(sym.GRAFIB, yycolumn, yyline, yytext());}
"titulo"              {AgregarToken( yytext(),"TITULO",yyline, yycolumn);return new Symbol(sym.TITULO, yycolumn, yyline, yytext());}
"titulox"             {AgregarToken( yytext(),"TITULOX",yyline, yycolumn);return new Symbol(sym.TITULOX, yycolumn, yyline, yytext());}
"tituloy"             {AgregarToken( yytext(),"TITULOY",yyline, yycolumn);return new Symbol(sym.TITULOY, yycolumn, yyline, yytext());}
"ejex"                {AgregarToken( yytext(),"EJEX",yyline, yycolumn);return new Symbol(sym.EJEX, yycolumn, yyline, yytext());}
"ejey"                {AgregarToken( yytext(),"EJEY",yyline, yycolumn);return new Symbol(sym.EJEY, yycolumn, yyline, yytext());}
"valores"             {AgregarToken( yytext(),"VALORES",yyline, yycolumn);return new Symbol(sym.VALORES, yycolumn, yyline, yytext());}
"graficapie"          {AgregarToken( yytext(),"GRAFIP",yyline, yycolumn);return new Symbol(sym.GRAFIP, yycolumn, yyline, yytext());}

"0"             {AgregarToken( yytext(),"CERO",yyline, yycolumn);return new Symbol(sym.CERO, yycolumn, yyline, yytext());}
"&&"            {AgregarToken( yytext(),"AND",yyline, yycolumn);return new Symbol(sym.AND, yycolumn, yyline, yytext());}
"||"            {AgregarToken( yytext(),"OR",yyline, yycolumn);return new Symbol(sym.OR, yycolumn, yyline, yytext());}
" !"            {AgregarToken( yytext(),"NOT",yyline, yycolumn);return new Symbol(sym.NOT, yycolumn, yyline, yytext());}
"$"             {AgregarToken( yytext(),"DOLAR",yyline, yycolumn);return new Symbol(sym.DOLAR, yycolumn, yyline, yytext());}

{entero}                {AgregarToken( yytext(),"ENTERO",yyline, yycolumn); return new Symbol(sym.ENTERO, yycolumn, yyline, yytext()); }
{identificador}         {AgregarToken( yytext(),"IDENTI",yyline, yycolumn); return new Symbol(sym.IDENTI, yycolumn, yyline, yytext()); }
{doublen}               {AgregarToken( yytext(),"DOUBLEN",yyline, yycolumn); return new Symbol(sym.DOUBLEN, yycolumn, yyline, yytext()); }
{cadena}                {AgregarToken( yytext(),"CADENA",yyline, yycolumn); return new Symbol(sym.CADENA, yycolumn, yyline, yytext()); }
{comentariolinea}       {AgregarToken( yytext(),"COMENLI",yyline, yycolumn); return new Symbol(sym.COMENLI, yycolumn, yyline, yytext()); }
{comentariomultilinea}  {AgregarToken( yytext(),"COMENMULTI",yyline, yycolumn); return new Symbol(sym.COMENMULTILI, yycolumn, yyline, yytext()); }

//------> Ingorados 
[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}

//------> Errores Léxicos 
.         { 
          System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn);
          AgregarError("Error Lexico", yytext(),yyline, yycolumn);
          }
