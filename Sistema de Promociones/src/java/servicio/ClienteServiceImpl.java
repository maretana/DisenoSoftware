package servicio;

import modelo.Cliente;
import modelo.Reporte;
import org.springframework.stereotype.Service;
import persistencia.ClientePersistencia;
import persistencia.ReportePersistencia;

/**
 * Implementacion de la interfaz ClienteService.
 * Spring utiliza esta clase gracias a la etiqueta @Service
 * @author Mario Retana Rojas <201029799>
 */
@Service
public class ClienteServiceImpl implements ClienteService{

    private ClientePersistencia _cliente;
    private ReportePersistencia _reporte;
    
    public ClienteServiceImpl() {
        this._cliente = new ClientePersistencia();
        this._reporte = new ReportePersistencia();
    }//fin constructor
    
    @Override
    public Cliente buscarClientePorID(String pIdentificacion) {
        Cliente cliente = this._cliente.buscarClientePorID(pIdentificacion);
        if (cliente != null)
            cliente.setPuntos(this._cliente.buscarInfoPuntosCliente());
        return cliente;
    }//fin buscar cliente por identificacion
    
    @Override
    public Reporte iniciarReporte(){
        Reporte reporte = this._reporte.contarDatos();
        return reporte;
    }
    
}//fin implementacion de ClienteService
