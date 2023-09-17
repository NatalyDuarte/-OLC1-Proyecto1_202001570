package Principal;

/**
 *
 * @author Natal
 */
public class TError {
    public String lexema, descripcion;
    public int linea, columna;

    public TError( String desc,String lex, int lin, int col){
        this.descripcion=desc;
        this.lexema=lex;
        this.linea=lin;
        this.columna=col;

    }
    public String get(){
        return "[ "+this.lexema+ ", "+this.descripcion+" ]";
    }
    public int getLinea(){
        return this.linea;
    }
    
}
