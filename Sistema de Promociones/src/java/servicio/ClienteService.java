package servicio;

import modelo.Cliente;
import modelo.Reporte;

/**
 * Se declaran funciones usadas por controaldores.
 * @author Mario Retana Rojas <201029799>
 */
public interface ClienteService {
    /**
     * Busca en la BD el cleinte con la identificacion dada.
     * @param pIdentificacion Identificacion unica de cada cliente.
     * @return Una instancia del modelo de Cliente. Si es nulo significa
     * que no fue posible encontrar al cliente.
     */
    public Cliente buscarClientePorID(String pIdentificacion);
    
    /**
     * Busca los datos iniciales del reporte en la BD.
     * @return Un modelo del reporte que va a ver el usuario.
     */
    public Reporte iniciarReporte();
}//fin ClienteService
