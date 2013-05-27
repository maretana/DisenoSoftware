package modelo;

/**
 * Esta clase maneja los detalles de los puntos ganados por un cliente.
 * @author Mario Retana Rojas <201029799>
 */
public class DetallesPuntos {
    
    private int _cantidad;
    private String _nombreEmpresa;
    private String _nombrePromocion;

    public DetallesPuntos() {
    }

    public DetallesPuntos(int cantidad, String nombreEmpresa, String nombrePromocion) {
        this._cantidad = cantidad;
        this._nombreEmpresa = nombreEmpresa;
        this._nombrePromocion = nombrePromocion;
    }

    //<editor-fold defaultstate="collapsed" desc="Getters y Setters">
    public String getNombrePromocion() {
        return _nombrePromocion;
    }
    
    public void setNombrePromocion(String nombrePromocion) {
        this._nombrePromocion = nombrePromocion;
    }
    
    public String getNombreEmpresa() {
        return _nombreEmpresa;
    }
    
    public void setNombreEmpresa(String nombreEmpresa) {
        this._nombreEmpresa = nombreEmpresa;
    }
    
    public int getCantidad() {
        return _cantidad;
    }
    
    public void setCantidad(int cantidad) {
        this._cantidad = cantidad;
    }
    //</editor-fold>

}//fin clase detalles puntos
