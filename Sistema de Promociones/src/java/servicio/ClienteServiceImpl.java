package servicio;

import modelo.Cliente;
import org.springframework.stereotype.Service;
import persistencia.ClientePersistencia;

/**
 * Implementacion de la interfaz ClienteService.
 * Spring utiliza esta clase gracias a la etiqueta @Service
 * @author Mario Retana Rojas <201029799>
 */
@Service
public class ClienteServiceImpl implements ClienteService{

    private ClientePersistencia _cliente;
    
    public ClienteServiceImpl() {
        this._cliente = new ClientePersistencia();
    }//fin constructor
    
    @Override
    public Cliente buscarClientePorID(String pIdentificacion) {
        Cliente cliente = this._cliente.buscarClientePorID(pIdentificacion);
        if (cliente != null)
            cliente.setPuntos(this._cliente.buscarInfoPuntosCliente());
        return cliente;
    }//fin buscar cliente por identificacion
    
}//fin implementacion de ClienteService
