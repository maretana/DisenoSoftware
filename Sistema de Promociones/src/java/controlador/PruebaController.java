package controlador;

import modelo.Prueba;
import modelo.Reporte;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import servicio.PruebaService;

/**
 * Controlador para las pruebas de rendimiento que realiza el usuario.
 * @author Mario Retana Rojas <201029799>
 */
@Controller
@SessionAttributes({"prueba","reporte"})
public class PruebaController {
    
    private final PruebaService _servicio;
    
    @Autowired
    public PruebaController(PruebaService pServicio){
        this._servicio = pServicio;
    }//fin constructor
    
    /**
     * Muestra la página de configuración de las pruebas.
     * @return La dirección del JSP que debe mostrar.
     */
    @RequestMapping(value="/pruebas")
    public String mostrarPaginaConfiguracion(Model model){
        Prueba prueba = Prueba.getInstance();
        Reporte reporte = this._servicio.iniciarReporte();
        model.addAttribute("prueba", prueba);
        model.addAttribute("reporte", reporte);
        return "/pruebas/index";
    }//fin mostrar la pagina de configuración
    
    @RequestMapping(value="/pruebas/llenardatos", method = RequestMethod.POST)
    public String llenarBaseDeDatos(Prueba prueba, Model model){
        if (this._servicio.llenarBase(prueba))
            return "redirect:/pruebas";
        else
            return "redirect:/error";
    }//fin llenar base de datos
    
    @RequestMapping(value="/pruebas/borrardatos")
    public String borrarDatosPrueba(Prueba prueba){
        if(this._servicio.borrarDatosPrueba(prueba))
            return "redirect:/pruebas";
        else
            return "redirect:/error";
    }//fin borrar datos prueba
    
    @RequestMapping(value="/pruebas/reporte")
    public ModelAndView ejecutarPruebas(Reporte reporte){
        int usuarios = reporte.getUsuariosConectados();
        Reporte nuevo = this._servicio.iniciarReporte();
        nuevo.setUsuariosConectados(usuarios);
        ModelAndView mav = new ModelAndView("/pruebas/reporte");
        this._servicio.ejecutarPruebas(nuevo);
        mav.addObject("reporte", nuevo);
        return mav;
    }//fin ejecutar pruebas
    
    @RequestMapping(value="/pruebas/reporte/exportar", method = RequestMethod.POST)
    public String exportarReporteExcel(Reporte reporte){
        this._servicio.exportarReporteExcel(reporte);
        return "redirect:/pruebas";
    }//fin exportar reporte a excel
    
}//fin pruebas controller
