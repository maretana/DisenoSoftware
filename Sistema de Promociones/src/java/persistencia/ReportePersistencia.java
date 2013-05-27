package persistencia;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.Reporte;
/**
 * Clase que se comunica con la base de datos. Llama a funciones necesarias para el reporte.
 * @author Mario Retana Rojas <201029799>
 */
public class ReportePersistencia implements JDBCProperties{
    
    private Connection _conexion;

    public ReportePersistencia() {
        try {
            Class.forName(DRIVER);//Carga el driver del motor de BD en el servidor
            this._conexion = DriverManager.getConnection(CONNECTION_STRING, USERNAME, PASSWORD);
        } catch (SQLException ex) {
            System.err.println("Imposible hacer conexion con la Base de Datos.");
            System.err.println(ex.getMessage());
            this._conexion = null;
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
            this._conexion = null;
        }//fin catch
    }//fin constructor
    
    public Reporte contarDatos(){
        String sql = "{call contarDatosReporte()}";
        Reporte reporte = new Reporte();
        try{
            CallableStatement call = this._conexion.prepareCall(sql);
            ResultSet rs = call.executeQuery();
            while(rs.next()){
                String nombre = rs.getString("nombre");
                int total = rs.getInt("total");
                if (nombre.equals("empresa"))
                    reporte.setEmpresasRegistradas(total);
                else if (nombre.equals("promos"))
                    reporte.setPromocionesRegistradas(total);
                else if (nombre.equals("premios"))
                    reporte.setPremiosRegistrados(total);
                else if (nombre.equals("productos"))
                    reporte.setProductosRegistrados(total);
                else if (nombre.equals("comprados"))
                    reporte.setProductosComprados(total);
                else if (nombre.equals("compras"))
                    reporte.setComprasRegistradas(total);
                else if (nombre.equals("clientes"))
                    reporte.setClientesRegistrados(total);
            }//fin while
        }//fin try
        catch (Exception e){
            System.err.println(e.getMessage());
            return null;
        }//fin catch
        return reporte;
    }//fin ontar datos
    
}//fin clase reporte persistencia
