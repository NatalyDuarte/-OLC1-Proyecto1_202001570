// ------------  Paquete e importaciones ------------
package AnalisJson; 

import java_cup.runtime.*;
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
nombrear = [a-zA-Z0-9_\-]+\.(json)
doublen = [0-9]+(\.[0-9]+)?([eE][-+]?[0-9]+)?
cadena = \"[\w\d]+\"
caden = \"(\\.|[^\"\\])*\"
FIN_LINEA = \r|\n|\r\n
INPUT = [^\r\n]
comentariolinea = \/+{INPUT}* {FIN_LINEA} ?
comentariomultilinea = \/\*[\s\S]*?\*\/

%%
// ------------  Reglas Lexicas -------------------


"{"             {AgregarToken( yytext(),"LLAVE_A",yyline, yycolumn);return new Symbol(sym.LLAVE_A, yycolumn, yyline, yytext());}
"}"             {AgregarToken( yytext(),"LLAVE_C",yyline, yycolumn);return new Symbol(sym.LLAVE_C, yycolumn, yyline, yytext());}
":"             {AgregarToken( yytext(),"DOSPUNTOS",yyline, yycolumn);return new Symbol(sym.DOSPUNTOS, yycolumn, yyline, yytext());}
        
","             {AgregarToken( yytext(),"COMA",yyline, yycolumn);return new Symbol(sym.COMA, yycolumn, yyline, yytext());}

{doublen}  {AgregarToken( yytext(),"DOUBLEN",yyline, yycolumn); return new Symbol(sym.DOUBLEN, yycolumn, yyline, yytext()); }
{cadena}  {AgregarToken( yytext(),"CADENA",yyline, yycolumn); return new Symbol(sym.CADENA, yycolumn, yyline, yytext()); }
{caden}  { AgregarToken( yytext(),"CADEN",yyline, yycolumn);return new Symbol(sym.CADEN, yycolumn, yyline, yytext()); }
{comentariolinea}  {AgregarToken( yytext(),"COMENLI",yyline, yycolumn); return new Symbol(sym.COMENLI, yycolumn, yyline, yytext()); }
{comentariomultilinea}  {AgregarToken( yytext(),"COMENMULTILI",yyline, yycolumn); return new Symbol(sym.COMENMULTILI, yycolumn, yyline, yytext()); }
{nombrear}  { AgregarToken( yytext(),"NOMBREAR",yyline, yycolumn);return new Symbol(sym.NOMBREAR, yycolumn, yyline, yytext()); }

//------> Ingorados 
[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}

//------> Errores Léxicos 
.           	{ 
                System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); 
                AgregarError("Error Lexico", yytext(),yyline, yycolumn);
                }
