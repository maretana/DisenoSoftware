package controlador;

import modelo.Prueba;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import servicio.ClienteService;

/**
 * Controlador para las pruebas de rendimiento que realiza el usuario.
 * @author Mario Retana Rojas <201029799>
 */
@Controller
public class PruebaController {
    
    private final ClienteService _servicio;
    
    @Autowired
    public PruebaController(ClienteService pServicio){
        this._servicio = pServicio;
    }//fin constructor
    
    /**
     * Muestra la página de configuración de las pruebas.
     * @return La dirección del JSP que debe mostrar.
     */
    @RequestMapping(value="/pruebas")
    public String mostrarPaginaConfiguracion(Model model){
        Prueba prueba = new Prueba();
        model.addAttribute("prueba", prueba);
        return "/pruebas/index";
    }//fin mostrar la pagina de configuración
    
}//fin pruebas controller
