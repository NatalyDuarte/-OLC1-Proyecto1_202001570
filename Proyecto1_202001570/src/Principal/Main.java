package Principal;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
/**
 *
 * @author Natal
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //analizadores("src/Analis/", "Lexer.jflex", "Parser.cup");
        //analizadores("src/AnalisJson/", "Lexer.jflex", "Parser.cup");
        Principal m = new Principal();
        m.setVisible(true);
        /*double [] valores = {12.1,19.1,91.2};
        String [] ejex = {"Hoa", "Jua","JOA"};
        func.Graficar.barras("Prueba","Titulox", "Tituloy", valores, ejex);*/
    }
    public static void analizadores(String ruta, String jflexFile, String cupFile){
        try {
            String opcionesJflex[] =  {ruta+jflexFile,"-d",ruta};
            jflex.Main.generate(opcionesJflex);

            String opcionesCup[] =  {"-destdir", ruta,"-parser","Parser",ruta+cupFile};
            java_cup.Main.main(opcionesCup);
            
        } catch (Exception e) {
            System.out.println("No se ha podido generar los analizadores");
            System.out.println(e);
        }
    }
    
}
