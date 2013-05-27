package servicio;

import modelo.Reporte;
import org.springframework.stereotype.Service;
import persistencia.ReportePersistencia;

/**
 * Implementación de la clase PruebaService.
 * @author Mario Retana Rojas <201029799>
 */
@Service
public class PruebaServiceImpl implements PruebaService{
    
    private ReportePersistencia _reporte;
    
    public PruebaServiceImpl(){
        this._reporte = new ReportePersistencia();
    }//fin constructor
    
    @Override
    public Reporte iniciarReporte(){
        Reporte reporte = this._reporte.contarDatos();
        return reporte;
    }//fin iniciar reporte
    
}//fin prueba service impl
