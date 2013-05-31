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
    public boolean borrarDatosPrueba(){
        return this._prueba.borrarDatosPrueba();
    }//fin borrar datos prueba
    
}//fin prueba service impl
