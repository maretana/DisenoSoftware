package persistencia;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Types;
import modelo.Cliente;

/**
 * Esta clase es usada por la parte de la aplicación que hace pruebas de rendimiento. Se encarga
 * de la conexión con la BD.
 * @author Mario Retana Rojas <201029799>
 */
public class PruebaPersistencia implements JDBCProperties{

    private Connection _conexion;

    public PruebaPersistencia(){
        try {
            Class.forName(DRIVER);//Carga el driver del motor de BD en el servidor
            this._conexion = DriverManager.getConnection(CONNECTION_STRING, USERNAME, PASSWORD);
            this._conexion.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
            this._conexion.setAutoCommit(false);
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
     * Registra un cliente en la base de datos usando el procedure especial de pruebas de rendimiento.
     * @param pCliente Cliente que va a ser registrado en la BD.
     * @return Retorna <code>true</code> si pudo agregar los datos con éxito y <code>false</code> de lo contrario.
     */
    public boolean registrarCliente(Cliente pCliente){
        String sql = "{call registrarClientePruebaRendimiento(?,?,?,?)} ";
        try{
            CallableStatement call = this._conexion.prepareCall(sql);
            call.setString(1, pCliente.getNombre());
            call.setString(2, pCliente.getApellido1());
            call.setString(3, pCliente.getApellido2());
            call.setString(4, pCliente.getIdentificacion());
            call.execute();
            this._conexion.commit();
        }//fin try
        catch(Exception e){
            System.err.println(e.getMessage());
            try{
                this._conexion.rollback();
            }//fin try
            catch (SQLException sqlex){
                System.err.println("Error al intentar hacer rollback!");
                System.err.println(sqlex.getMessage());
            }//fin catch
            return false;
        }//fin catch
        return true;
    }//fin resgistrar cliente
    
    /**
     * Registra una compra de un cliente en particular para realizar pruebas de rendimiento.
     * @param pCodigo Semilla que usará la base de datos para generar un código de factura.
     * @param pIdentificacion Identificación del cliente al que se le registra la compra.
     * @param pDias La compra queda regitrada que se hizo hace pDias a partir de la fecha actual de la BD.
     * @return Retorna el código de la factura autogenerado por la BD. Retorna <code>null</code> si ocurre
     *         algún error durante la conexión a la BD.
     */
    public String registrarNuevaCompra(String pCodigo, String pIdentificacion, int pDias){
        String sql = "{call registrarNuevaCompraPruebaRendimiento(?,?,?)}";
        String codigo_bd = pCodigo;
        try{
            CallableStatement call = this._conexion.prepareCall(sql);
            call.registerOutParameter(1, Types.CHAR);
            call.setString(1, codigo_bd);
            call.setString(2, pIdentificacion);
            call.setInt(3, pDias);
            call.execute();
            codigo_bd = call.getString(1);
            this._conexion.commit();
        }//fin try
        catch (Exception e){
            System.err.println(e.getMessage());
            try{
                this._conexion.rollback();
            }//fin try
            catch(SQLException sqlex){
                System.err.println("Error al hacer rollback!");
                System.err.println(sqlex.getMessage());
            }//fin catch
            return null;
        }//fin exception e
        return codigo_bd;
    }//fin registrar nueva compra
    
    /**
     * Ingresa un detalle a la factura con el codigo dado.
     * @param pCodigo   Codigo de la factura a la que se agrega el detalle.
     * @param pEmpresa  Nombre de la empresa en donde se hizo la compra.
     * @param pProducto Nombre del producto que se compró.
     * @param pCantidad Cantidad de productos del mismo nombre que se compraron.
     * @return Retorna <code>true</code> si logra insertar el detalle a la BD o <code>false</code> de lo contrario.
     */
    public boolean ingresarDetalleCompra(String pCodigo, String pEmpresa, String pProducto, int pCantidad){
        String sql = "{call insertarDetalleCompraPruebaRendimiento(?,?,?,?)}";
        try{
            CallableStatement call = this._conexion.prepareCall(sql);
            call.setString(1, pCodigo);
            call.setString(2, pProducto);
            call.setInt(3, pCantidad);
            call.setString(4, pEmpresa);
            call.execute();
            this._conexion.commit();
        }//fin try
        catch (Exception e){
            System.err.println(e.getMessage());
            System.err.println(pProducto + " " + pEmpresa);
            try{
                this._conexion.rollback();
            }//fin try
            catch (SQLException sqlex){
                System.err.println("Error al hacer rollback!");
                System.err.println(sqlex.getMessage());
            }//fin catch
            return false;
        }//fin catch
        return true;
    }//fin ingresar detalle de compra
    
    /**
     * Llena la base de datos con la cantidad de datos que indico el usuario.
     * @param pEmpresas Cantidad de empresas que se van a registrar.
     * @param pPromociones Cantidad de promociones que cada empresa tendra registradas.
     * @param pProductos Cantidad de productos registrados en cada promocion.
     * @param pPremios Total de premios de cada promocion.
     * @return Retorna <code>true</code> si logra llenar la BD y <code>false</code> de lo contrario.
     */
    public boolean llenarBase(int pEmpresas, int pPromociones, int pProductos, int pPremios){
        String sql = "{call llenarDatosPrueba(?,?,?,?)}";
        try{
            CallableStatement call = this._conexion.prepareCall(sql);
            call.setInt(1, pEmpresas);
            call.setInt(2, pPromociones);
            call.setInt(3, pProductos);
            call.setInt(4, pPremios);
            call.execute();
            this._conexion.commit();
        }//fin try
        catch (Exception e){
            System.err.println(e.getMessage());
            try{
                this._conexion.rollback();
            }//fin try
            catch (SQLException sqlex){
                System.err.println("Error al hacer rollback!");
                System.err.println(sqlex.getMessage());
            }//fin catch
            return false;
        }//fin catch
        return true;
    }//fin llenar base

    /**
     * Borra los datos de prueba que fueron insertados en la BD.
     * @return Retorna <code>true</code> si logra borrar los datos y <code>false</code>
     * de lo contrario.
     */
    public boolean borrarDatosPrueba(){
        String sql = "{call borrarDatosPrueba()}";
        try{
            CallableStatement call = this._conexion.prepareCall(sql);
            call.execute();
            call = this._conexion.prepareCall("{call borrarClientesPruebaRendimiento()}");
            call.execute();
            this._conexion.commit();
        }//fin try
        catch (Exception e){
            System.err.println(e.getMessage());
            try{
                this._conexion.rollback();
            }//fin try
            catch (SQLException sqlex){
                System.err.println("Error al hacer rollback!");
                System.err.println(sqlex.getMessage());
            }//fin catch
            return false;
        }//fin catch
        return true;
    }//fin borrar datos prueba
    
}//fin clase pruebas rendimiento persistencia