package controlador;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



/**
 * Clase controladora para las funciones del cliente.
 * @author Mario Retana Rojas <201029799>
 */

@Controller
public class ClienteController {
    
    public ClienteController(){}
    
    @RequestMapping(value = "/cliente/buscarporid", method = RequestMethod.GET)
    public String buscarClientePorID(String pID){
        return "index";
    }//fin buscarClientePorID
}
