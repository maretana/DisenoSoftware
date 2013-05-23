package persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Clase de persistencia que se encarga de buscar y guardar los datos relacionados a los clientes en la BD.
 * @author Mario Retana Rojas <201029799>
 */
public class ClientePersistencia implements JDBCProperties{
    
    private Connection _conexion;
    
    public ClientePersistencia(){
        try {
            this._conexion = DriverManager.getConnection(CONNECTION_STRING, USERNAME, PASSWORD);
        } catch (SQLException ex) {
            System.err.println("Imposible hacer conexion con la Base de Datos.");
            System.err.println(ex.getMessage());
            this._conexion = null;
        }//fin catch
    }//fin constructor
}//fin cliente persistencia
