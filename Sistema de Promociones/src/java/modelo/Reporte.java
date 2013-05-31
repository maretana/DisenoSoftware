package modelo;

import java.util.ArrayList;
import java.util.List;

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
    private int _usuariosConectados;
    private long _tiempoMasCorto;
    private long _tiempoMasLargo;
    private long _tiempoPromedio;
    private List<Long> _duracionesConsulta;
    
    public Reporte(){
        this._duracionesConsulta = new ArrayList<Long>();
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
    
    public int getUsuariosConectados() {
        return _usuariosConectados;
    }

    public void setUsuariosConectados(int usuariosConectados) {
        this._usuariosConectados = usuariosConectados;
    }
    
    public List<Long> getDuracionesConsulta() {
        return _duracionesConsulta;
    }
    
    public long getTiempoPromedio() {
        return _tiempoPromedio;
    }

    public void setTiempoPromedio(long tiempoPromedio) {
        this._tiempoPromedio = tiempoPromedio;
    }


    public long getTiempoMasLargo() {
        return _tiempoMasLargo;
    }

    public void setTiempoMasLargo(long tiempoMasLargo) {
        this._tiempoMasLargo = tiempoMasLargo;
    }


    public long getTiempoMasCorto() {
        return _tiempoMasCorto;
    }

    public void setTiempoMasCorto(long tiempoMasCorto) {
        this._tiempoMasCorto = tiempoMasCorto;
    }
    //</editor-fold>
    
    /**
     * Calcula el tiempo mas largo, el mas corto y el tiempo promedio.
     */
    public void calcularTiempos(){
        this._tiempoMasCorto = this._duracionesConsulta.get(0);
        this._tiempoMasLargo = this._duracionesConsulta.get(0);
        long suma = this._duracionesConsulta.get(0);
        for (int i=1;i<this._duracionesConsulta.size();i++){
            long num = this._duracionesConsulta.get(i);
            suma += num;
            if (num > this._tiempoMasLargo)
                this._tiempoMasLargo = num;
            else if (num < this._tiempoMasCorto)
                this._tiempoMasCorto = num;
        }//fin for
        this._tiempoPromedio = suma / this._duracionesConsulta.size();
    }//fin calcular tiempos

}//fin clase reporte
