package controlador;

import javax.servlet.http.HttpServletRequest;
import modelo.Cliente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import servicio.ClienteService;



/**
 * Clase controladora para las funciones del cliente.
 * @author Mario Retana Rojas <201029799>
 */


@Controller
public class ClienteController {
    
    private final ClienteService _servicio;
    
    @Autowired
    public ClienteController(ClienteService pServicio){
        this._servicio = pServicio;
    }//fin constructor
    
    @RequestMapping(value = "/cliente/buscarporid", method = RequestMethod.GET)
    public String buscarClientePorID(HttpServletRequest request){
        Cliente cliente = this._servicio.buscarClientePorID(request.getParameter("identificacion"));
        return "redirect:/index?nombre=" + (cliente == null ? null : cliente.getNombre());
    }//fin buscarClientePorID
}
