package modelo;

/**
 * Esta clase contiene la informacion que sera puesta en el reporte.
 * @author Mario Retana Rojas 201029799
 */
public class Reporte {
    
    private int _clientesRegistrados;
    private int _empresasRegistradas;
    private int _productosComprados;
    private int _comprasRegistradas;
    private int _promocionesRegistradas;
    private int _productosRegistrados;
    private int _premiosRegistrados;
    private int _maxCompras;
    private int _maxProductosComprados;
    private int _maxDias;
    
    public Reporte(){
    }//fin constructor

    //<editor-fold defaultstate="collapsed" desc="Getters y Setters">
    public int getPremiosRegistrados() {
        return _premiosRegistrados;
    }
    
    public void setPremiosRegistrados(int premiosRegistrados) {
        this._premiosRegistrados = premiosRegistrados;
    }
    
    
    public int getProductosRegistrados() {
        return _productosRegistrados;
    }
    
    public void setProductosRegistrados(int productosRegistrados) {
        this._productosRegistrados = productosRegistrados;
    }
    
    public int getPromocionesRegistradas() {
        return _promocionesRegistradas;
    }
    
    public void setPromocionesRegistradas(int promocionesRegistradas) {
        this._promocionesRegistradas = promocionesRegistradas;
    }
    
    public int getComprasRegistradas() {
        return _comprasRegistradas;
    }
    
    public void setComprasRegistradas(int comprasRegistradas) {
        this._comprasRegistradas = comprasRegistradas;
    }
    
    public int getProductosComprados() {
        return _productosComprados;
    }
    
    public void setProductosComprados(int productosComprados) {
        this._productosComprados = productosComprados;
    }
    
    
    public int getEmpresasRegistradas() {
        return _empresasRegistradas;
    }
    
    public void setEmpresasRegistradas(int empresasRegistradas) {
        this._empresasRegistradas = empresasRegistradas;
    }
    
    public int getClientesRegistrados() {
        return _clientesRegistrados;
    }
    
    public void setClientesRegistrados(int clientesRegistrados) {
        this._clientesRegistrados = clientesRegistrados;
    }
    
    public int getMaxDias() {
        return _maxDias;
    }

    public void setMaxDias(int maxDias) {
        this._maxDias = maxDias;
    }


    public int getMaxProductosComprados() {
        return _maxProductosComprados;
    }

    public void setMaxProductosComprados(int maxProductosComprados) {
        this._maxProductosComprados = maxProductosComprados;
    }

    public int getMaxCompras() {
        return _maxCompras;
    }

    public void setMaxCompras(int maxCompras) {
        this._maxCompras = maxCompras;
    }
    //</editor-fold>

}//fin clase reporte
