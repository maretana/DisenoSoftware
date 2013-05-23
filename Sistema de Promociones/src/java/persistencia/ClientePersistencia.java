package persistencia;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.Cliente;

/**
 * Clase de persistencia que se encarga de buscar y guardar los datos relacionados a los clientes en la BD.
 * @author Mario Retana Rojas <201029799>
 */
public class ClientePersistencia implements JDBCProperties{
    
    private Connection _conexion;
    private String _nombre;
    private String _apellido1;
    private String _apellido2;
    private String _identificacion;
    
    public ClientePersistencia(){
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
    
    /**
     * Busca un cliente en la base de datos dada la identificación que la empresa
     * le haya dado. Como cada identificación es única, sólo se toma en cuenta el
     * caso en que hay 1 resultado y el caso en que hay 0 resultados.
     * @param pIdentificacion Identificacion que se va buscar.
     * @return Un modelo Cliente nuevo.
     */
    public Cliente buscarClientePorID(String pIdentificacion){
        try{
            CallableStatement call = this._conexion.prepareCall("{call buscarClientePorID(?)}");
            call.setString(1, pIdentificacion);
            ResultSet rs = call.executeQuery();
            if (rs.next()){
                this._nombre = rs.getString("nombre");
                this._apellido1 = rs.getString("apellido1");
                this._apellido2 = rs.getString("apellido2");
                this._identificacion = pIdentificacion;
                return new Cliente(this._nombre, this._apellido1, this._apellido2, this._identificacion);
            }//fin si encontro un resultado
            else
                return null;
        }//fin try
        catch(Exception e){
            System.err.println("Error con la conexion a la BD");
            System.err.println(e.getMessage());
            return null;
        }//fin catch
    }//fin buscar cliente por identificacion
}//fin cliente persistencia
