package modelo;

import persistencia.ClientePersistencia;

/**
 * Cada hilo llama a la funcion de consulta a la BD y guarda el tiempo de ejecucion.
 * @author Mario Retana Rojas <201029799>
 */
public class HiloSimulacion implements Runnable{
    
    private long _tiempo;
    private String _identificacion;

    public HiloSimulacion(String pIdentificacion){
        this._identificacion = pIdentificacion;
    }

    @Override
    public void run() {
        long inicio = System.nanoTime();
        ClientePersistencia cliente = new ClientePersistencia();
        cliente.buscarClientePorID(_identificacion);
        cliente.buscarInfoPuntosCliente();
        this._tiempo = System.nanoTime()- inicio;
    }//fin run
    
    //<editor-fold defaultstate="collapsed" desc="Getters y Setters">
    public long getTiempo() {
        return _tiempo;
    }
    
    public String getIdentificacion() {
        return _identificacion;
    }
    
    public void setIdentificacion(String identificacion) {
        this._identificacion = identificacion;
    }
    //</editor-fold>
}//fin hilo servidor
