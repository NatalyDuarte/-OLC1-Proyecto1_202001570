package func;

/**
 *
 * @author Natal
 */
import java.awt.image.BufferedImage;
import java.util.Iterator;
import java.util.LinkedList;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.category.DefaultCategoryDataset;
public class Graficar {
    public static LinkedList<String> funciones = new LinkedList<>();//Lista de funciones estadisticas
    public static LinkedList<String> ejexs = new LinkedList<>();
    public static LinkedList<String> valoress = new LinkedList<>();
    public static LinkedList<Double> valorese = new LinkedList<>();
    public static String Titulo, TituloX, TituloY;
    public static String ejex [];
    public static double[] valores ;
    public static void AgregarS(String nombre,String valor){
        nombre = valor;
        nombre = nombre.replaceAll("\"", "");
        System.out.println("Aqui");
        System.out.println(nombre);
    }
    public static void AgregarDo(String nombre,String valor){
        nombre = valor;
        System.out.println("Aqui");
        System.out.println(nombre);
    }
    public static void AgregarD(String nombre,String valor){
        nombre = valor;
        System.out.println("Aqui");
        System.out.println(nombre);

    }
    public static void pasareje(){
        // Crear un arreglo de String del mismo tamaño que el LinkedList
        ejex = new String[ejexs.size()];

        // Pasar los datos del LinkedList al arreglo
        ejex = ejexs.toArray(ejex);

        // Imprimir el contenido del arreglo
        for (String elemento : ejex) {
            System.out.println(elemento);
        }
        
    }
    
    public static void pasarval(){
        valores = new double[valoress.size()];
        // Recorrer el LinkedList utilizando un bucle while y un Iterator
        Iterator<String> iterator = valoress.iterator();
        while (iterator.hasNext()) {
            String elemento = iterator.next();
            elemento = elemento.replaceAll(",", "");
            double element = Double.parseDouble(elemento);
            valorese.add(element);
            System.out.println(element);
        }
        Iterator<Double> iterators = valorese.iterator();
        while (iterators.hasNext()) {
            Double elemento = iterators.next();
            for (int i = 0; i < valores.length; i++) {
                if (valores[i] == 0.0){
                    valores[i]= elemento;
                }
            }
        }
        System.out.println("Porbaremos aqui");
        for (int i = 0; i < valores.length; i++) {
            System.out.println(valores[i]);
        }
    }
    // Para agregar un nuevo valor al final del arreglo, puedes crear un nuevo arreglo con un tamaño mayor y copiar los valores anteriores:
    public static void agregarDato(double nuevoDato) {
        // Crea un nuevo arreglo con un tamaño mayor
        double[] nuevoArreglo = new double[valores.length + 1];

        // Copia los elementos del arreglo original al nuevo arreglo
        for (int i = 0; i < valores.length; i++) {
            nuevoArreglo[i] = valores[i];
        }

        // Agrega el nuevo valor al final del nuevo arreglo
        nuevoArreglo[valores.length] = nuevoDato;

        // Actualiza la referencia al nuevo arreglo
        valores = nuevoArreglo;
    }
     
            
    public static void barras()
    {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        for(int i = 0; i <ejexs.size(); i++){
            System.out.println(valores[i]);
            dataset.setValue(valores[i], "Valor", ejex[i]);
        }
        
        JFreeChart chart = ChartFactory.createBarChart(
                Titulo,
                TituloX, 
                TituloY, 
                dataset, 
                PlotOrientation.VERTICAL,
                true, 
                false, 
                false
        );
        
        //Mostramos la grafica en pantalla
        ChartFrame frame = new ChartFrame("GraficaBarras", chart);
        frame.pack();
        frame.setVisible(true);
    }
    
    public static void Pie(){
        DefaultPieDataset pieDataset = new DefaultPieDataset();
        for(int i = 0; i <ejexs.size(); i++){
            pieDataset.setValue(ejex[i],valores[i]);
        }
        
        JFreeChart chart = ChartFactory.createPieChart(
                Titulo,
                pieDataset,
                true,
                true,
                false
        );

        //Mostramos la grafica en pantalla
        ChartFrame frame = new ChartFrame("GraficaPie", chart);
        frame.pack();
        frame.setVisible(true);
    }
}
