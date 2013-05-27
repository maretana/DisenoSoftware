package modelo;

import java.util.List;

/**
 *
 * @author Mario Retana Rojas <201029799>
 */
public class Cliente {
    
    private String _nombre;
    private String _apellido1;
    private String _apellido2;
    private String _identificacion;
    private List<DetallesPuntos> _puntos;

    public Cliente() {
    }//fin constructor

    public Cliente(String pNombre, String pApellido1, String pApellido2, String pIdentificacion) {
        this._nombre = pNombre;
        this._apellido1 = pApellido1;
        this._apellido2 = pApellido2;
        this._identificacion = pIdentificacion;
    }//fin constructor
    
    //<editor-fold defaultstate="collapsed" desc="Getters y Setters">
    
    public String getNombre() {
        return _nombre;
    }

    public void setNombre(String nombre) {
        this._nombre = nombre;
    }
    
    public String getApellido1() {
        return _apellido1;
    }

    public void setApellido1(String apellido1) {
        this._apellido1 = apellido1;
    }
    
    public String getApellido2() {
        return _apellido2;
    }

    public void setApellido2(String apellido2) {
        this._apellido2 = apellido2;
    }
    
    public String getIdentificacion() {
        return _identificacion;
    }

    public void setIdentificacion(String identificacion) {
        this._identificacion = identificacion;
    }
    
    public List<DetallesPuntos> getPuntos() {
        return _puntos;
    }

    public void setPuntos(List<DetallesPuntos> _puntos) {
        this._puntos = _puntos;
    }
    
    //</editor-fold>
    
}//fin clase Cliente
