package persistencia;

/**
 * Esta interfaz contiene las funciones básicas y constantes que se necesitan
 * para comunicarse con la base de datos.
 * @author Mario Retana Rojas <201029799>
 */
public interface JDBCProperties {
    public static final String CONNECTION_STRING = "jdbc:mysql://192.168.1.107:3306/sys_promo";
    public static final String USERNAME = "remoto";
    public static final String PASSWORD = "admin";
    public static final String DRIVER = "com.mysql.jdbc.Driver";
}//fin JDBC Properties
