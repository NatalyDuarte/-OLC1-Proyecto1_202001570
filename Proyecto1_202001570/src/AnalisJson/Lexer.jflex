// ------------  Paquete e importaciones ------------
package AnalisJson; 

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
doublen = [0-9]+(\.[0-9]+)?([eE][-+]?[0-9]+)?
cadena = \"[\w\d]+\"
caden = \"(\\.|[^\"\\])*\"
FIN_LINEA = \r|\n|\r\n
INPUT = [^\r\n]
comentariolinea = \/+{INPUT}* {FIN_LINEA} ?
comentariomultilinea = \/\*[\s\S]*?\*\/

%%
// ------------  Reglas Lexicas -------------------


"{"             {return new Symbol(sym.LLAVE_A, yycolumn, yyline, yytext());}
"}"             {return new Symbol(sym.LLAVE_C, yycolumn, yyline, yytext());}
":"             {return new Symbol(sym.DOSPUNTOS, yycolumn, yyline, yytext());}
        
","             {return new Symbol(sym.COMA, yycolumn, yyline, yytext());}

{doublen}  { return new Symbol(sym.DOUBLEN, yycolumn, yyline, yytext()); }
{cadena}  { return new Symbol(sym.CADENA, yycolumn, yyline, yytext()); }
{caden}  { return new Symbol(sym.CADEN, yycolumn, yyline, yytext()); }
{comentariolinea}  { return new Symbol(sym.COMENLI, yycolumn, yyline, yytext()); }
{comentariomultilinea}  { return new Symbol(sym.COMENMULTILI, yycolumn, yyline, yytext()); }

//------> Ingorados 
[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}

//------> Errores Léxicos 
.           	{ System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); }
