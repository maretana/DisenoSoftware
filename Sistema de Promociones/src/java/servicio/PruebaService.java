package servicio;

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
    
}//fin interface PruebaService
