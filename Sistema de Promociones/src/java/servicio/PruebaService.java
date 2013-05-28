package servicio;

import modelo.Prueba;
import modelo.Reporte;

/**
 * Declaración de las funciones usadas por el controlador.
 * @author Mario Retana Rojas <201029799>
 */
public interface PruebaService {
    
    /**
     * Busca los datos iniciales del reporte en la BD.
     * @return Un modelo del reporte que va a ver el usuario.
     */
    public Reporte iniciarReporte();
    
    /**
     * Llena la base de datos con la cantidad de datos que indico el usuario.
     * @param prueba las configuraciones de la prueba.
     * @return Retorna <code>true</code> si logra llenar la BD y <code>false</code> de lo contrario.
     */
    public boolean llenarBase(Prueba prueba);
    
    /**
     * Borra los datos de prueba que fueron agregados a la BD.
     * @return Retorna <code>true</code> si logra borrar los datos o <code>false</code> en
     * caso contrario.
     */
    public boolean borrarDatosPrueba();
    
}//fin interface PruebaService
