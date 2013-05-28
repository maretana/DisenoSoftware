package servicio;

import modelo.Reporte;
import org.springframework.stereotype.Service;
import persistencia.PruebaPersistencia;
import persistencia.ReportePersistencia;

/**
 * Implementación de la clase PruebaService.
 * @author Mario Retana Rojas <201029799>
 */
@Service
public class PruebaServiceImpl implements PruebaService{
    
    private ReportePersistencia _reporte;
    private PruebaPersistencia _prueba;
    
    public PruebaServiceImpl(){
        this._reporte = new ReportePersistencia();
        this._prueba = new PruebaPersistencia();
    }//fin constructor
    
    @Override
    public Reporte iniciarReporte(){
        Reporte reporte = this._reporte.contarDatos();
        return reporte;
    }//fin iniciar reporte
    
    @Override
    public boolean llenarBase(int pEmpresas, int pPromociones, int pProductos, int pPremios){
        return this._prueba.llenarBase(pEmpresas, pPromociones, pProductos, pPremios);
    }//fin llenar base
    
    @Override
    public boolean borrarDatosPrueba(){
        return this._prueba.borrarDatosPrueba();
    }//fin borrar datos prueba
    
}//fin prueba service impl
