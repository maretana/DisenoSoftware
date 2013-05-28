package servicio;

import modelo.Cliente;
import modelo.Prueba;
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
    public boolean llenarBase(Prueba prueba){
        if(this._prueba.llenarBase(prueba.getTotalEmpresas(), prueba.getPromocionesPorEmpresa(), prueba.getProductosPorPromocion(), prueba.getPremiosPorPromocion())){
            boolean respuesta = true;
            String empresa = "Empresa";
            String nombre = "Cliente";
            int identificacion = 186429862;
            for(int i=0;i<prueba.getClientesPorRegistrar();i++){
                Cliente cliente = new Cliente();
                cliente.setNombre(nombre + i);
                cliente.setApellido1("Apellido1");
                cliente.setApellido2("Apellido2");
                cliente.setIdentificacion(identificacion + "");
                respuesta = this._prueba.registrarCliente(cliente);
                int compras = prueba.generarInt(prueba.getMaxCompras());
                for(int j=0;j<compras;j++){
                    int dias = prueba.generarInt(prueba.getMaxDias());
                    int comprados = prueba.generarInt(prueba.getMaxProductosComprados());
                    String codigo = this._prueba.registrarNuevaCompra(j+(i*prueba.getClientesPorRegistrar())+"", identificacion + "", dias);
                    String emp = empresa + prueba.generarInt(prueba.getTotalEmpresas());
                    for (int k=0;k<comprados;k++)
                        respuesta = this._prueba.ingresarDetalleCompra(codigo, emp, "Producto" + prueba.generarInt(prueba.getProductosPorPromocion()*prueba.getPromocionesPorEmpresa()), prueba.generarInt(10));
                }//fin for
                identificacion++;
            }//fin for
            return respuesta;
        }//fin si falla el llenado inicial
        else
            return false;
    }//fin llenar base
    
    @Override
    public boolean borrarDatosPrueba(){
        return this._prueba.borrarDatosPrueba();
    }//fin borrar datos prueba
    
}//fin prueba service impl
