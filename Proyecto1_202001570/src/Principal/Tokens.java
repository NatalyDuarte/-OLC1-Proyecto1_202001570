package Principal;

/**
 *
 * @author Natal
 */
public class Tokens {
    public String lexema, token;
    public int linea, columna;

    public Tokens(String lex, String tok, int lin, int col){
        this.lexema=lex;
        this.token = tok;
        this.linea=lin;
        this.columna=col;

    }
    public String get(){
        return "[ "+this.lexema+ ", "+this.token+" ]";
    }
    public int getLinea(){
        return this.linea;
    }
    
}
