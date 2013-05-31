package modelo;

/**
 * Esta clase guarda las configuraciones para hacer una prueba de rendimiento.
 * @author Mario Retana Rojas <201029799>
 */
public class Prueba {
    
    private int _totalEmpresas;
    private int _promocionesPorEmpresa;
    private int _premiosPorPromocion;
    private int _productosPorPromocion;
    private int _maxCompras;
    private int _maxProductosComprados;
    private int _maxDias;
    private int _clientesPorRegistrar;
    private static final Prueba INSTANCIA = new Prueba();

    private Prueba(){
        this._maxDias = 30;
    }//fin constructor

    //<editor-fold defaultstate="collapsed" desc="Getters y Setters">
    public int getProductosPorPromocion() {
        return _productosPorPromocion;
    }
    
    public void setProductosPorPromocion(int productosPorPromocion) {
        this._productosPorPromocion = productosPorPromocion;
    }
    
    
    public int getPremiosPorPromocion() {
        return _premiosPorPromocion;
    }
    
    public void setPremiosPorPromocion(int premiosPorPromocion) {
        this._premiosPorPromocion = premiosPorPromocion;
    }
    
    
    public int getPromocionesPorEmpresa() {
        return _promocionesPorEmpresa;
    }
    
    public void setPromocionesPorEmpresa(int promocionesPorEmpresa) {
        this._promocionesPorEmpresa = promocionesPorEmpresa;
    }
    
    
    public int getTotalEmpresas() {
        return _totalEmpresas;
    }
    
    public void setTotalEmpresas(int totalEmpresas) {
        this._totalEmpresas = totalEmpresas;
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
    
    public int getClientesPorRegistrar() {
        return _clientesPorRegistrar;
    }

    public void setClientesPorRegistrar(int clientesPorRegistrar) {
        this._clientesPorRegistrar = clientesPorRegistrar;
    }
    //</editor-fold>
    
    /**
     * Genera un numero enre 1 y el limite.
     * @param pLimite Limite del numero que se va a generar.
     * @param pMin Minimo numero.
     * @return Retorna un numero entero entre 1 y el limite.
     */
    public int generarInt(int pMin, int pLimite){
        return pMin + (int)(Math.random() * ((pLimite - pMin) + 1));
    }//fin generar dias

    public static Prueba getInstance(){
        return INSTANCIA;
    }
    
}//fin clase prueba
