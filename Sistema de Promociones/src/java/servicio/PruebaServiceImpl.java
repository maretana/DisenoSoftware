package servicio;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import modelo.Cliente;
import modelo.HiloSimulacion;
import modelo.Prueba;
import modelo.Reporte;
import net.sf.jxls.transformer.XLSTransformer;
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
    public boolean llenarBase(Prueba prueba){
        if(this._prueba.llenarBase(prueba.getTotalEmpresas(), prueba.getPromocionesPorEmpresa(), prueba.getProductosPorPromocion(), prueba.getPremiosPorPromocion())){
            boolean respuesta = true;;
            int cod = 0;
            int identificacion = 186429862;
            for(int i=0;i<prueba.getClientesPorRegistrar();i++){
                Cliente cliente = new Cliente();
                cliente.setNombre("Cliente" + i);
                cliente.setApellido1("Apellido1");
                cliente.setApellido2("Apellido2");
                cliente.setIdentificacion(identificacion + "");
                respuesta = this._prueba.registrarCliente(cliente);
                int compras = prueba.generarInt(1,prueba.getMaxCompras());
                for(int j=0;j<compras;j++){
                    int dias = prueba.generarInt(1,prueba.getMaxDias());
                    int comprados = prueba.generarInt(1,prueba.getMaxProductosComprados());
                    String codigo = this._prueba.registrarNuevaCompra((cod +""), identificacion + "", dias);
                    cod++;
                    String empresa = "Empresa" + prueba.generarInt(0,prueba.getTotalEmpresas() - 1);
                    for (int k=0;k<comprados;k++){
                        String producto = "Producto" + prueba.generarInt(0, (prueba.getProductosPorPromocion() * prueba.getPromocionesPorEmpresa())-1);
                        int cantidad = prueba.generarInt(1, 10);
                        respuesta = this._prueba.ingresarDetalleCompra(codigo, empresa,producto, cantidad);
                    }//fin for
                }//fin for
                identificacion++;
            }//fin for
            return respuesta;
        }//fin si falla el llenado inicial
        else
            return false;
    }//fin llenar base
    
    @Override
    public boolean borrarDatosPrueba(Prueba prueba){
        if (this._prueba.borrarDatosPrueba()){
            prueba.setClientesPorRegistrar(0);
            prueba.setMaxCompras(0);
            prueba.setMaxProductosComprados(0);
            prueba.setPremiosPorPromocion(0);
            prueba.setProductosPorPromocion(0);
            prueba.setPromocionesPorEmpresa(0);
            prueba.setTotalEmpresas(0);
            return true;
        }
        else
            return false;
    }//fin borrar datos prueba
    
    @Override
    public void ejecutarPruebas(Reporte reporte){
        ExecutorService executor = Executors.newFixedThreadPool(reporte.getUsuariosConectados());
        int id = 0;
        List<HiloSimulacion> hilos = new ArrayList<HiloSimulacion>();
        for (int i=0;i<reporte.getUsuariosConectados();i++){
            HiloSimulacion hilo = new HiloSimulacion((186429862 + id) + "");
            hilos.add(hilo);
            executor.execute(hilo);
            id = (id + 1) % reporte.getClientesRegistrados();
        }//fin for
        executor.shutdown();
        try {
            executor.awaitTermination(1, TimeUnit.DAYS);
        } catch (InterruptedException ex) {
            System.err.println(ex.getMessage());
        }
        for (int i=0;i<hilos.size();i++){
            reporte.getDuracionesConsulta().add(hilos.get(i).getTiempo());
        }//fin for
        reporte.calcularTiempos();
    }//fin ejecutar pruebas

    @Override
    public void exportarReporteExcel(Reporte reporte) {
        String plantilla = "C:\\Users\\Mario\\Desktop\\TEC\\VII Semestre, 2013\\Diseño de Software\\Proyecto 2\\Repositorio\\Sistema de Promociones\\src\\resources\\excel\\plantilla.xls";
        String reportexls = "C:\\Users\\Mario\\Desktop\\TEC\\VII Semestre, 2013\\Diseño de Software\\Proyecto 2\\Repositorio\\Sistema de Promociones\\src\\resources\\excel\\reporte.xls";
        Map beans = new HashMap();
        beans.put("reporte", reporte);
        XLSTransformer transformer = new XLSTransformer();
        try {
            transformer.transformXLS(plantilla, beans, reportexls);
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
        }//fin try - catch
        
    }//fin exportar reporte a excel
    
}//fin prueba service impl
