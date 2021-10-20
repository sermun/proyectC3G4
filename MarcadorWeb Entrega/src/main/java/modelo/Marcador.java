package modelo;

import java.sql.Date;

public class Marcador {
    private int idPartido, idUsuario, local, visitante;
    private Date fecha;
    private String golesLocal, golesVisitante;
    
    public Marcador(int idPartido, int idUsuario, int local, int visitante,
            Date fecha, String golesLocal, String golesVisitante) {
        this.idPartido = idPartido;
        this.idUsuario = idUsuario;
        this.local = local;
        this.visitante = visitante;
        this.golesLocal = golesLocal;
        this.golesVisitante = golesVisitante;
        this.fecha = fecha;        
    }

    public int getIdPartido() {
        return idPartido;
    }

    public void setId(int idPartidos) {
        this.idPartido = idPartidos;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getLocal() {
        return local;
    }

    public void setLocal(int local) {
        this.local = local;
    }

    public int getVisitante() {
        return visitante;
    }

    public void setVisitante(int visitante) {
        this.visitante = visitante;
    }

    public String getGolesLocal() {
        return golesLocal;
    }

    public void setGolesLocal(String golesLocal) {
        this.golesLocal = golesLocal;
    }

    public String getGolesVisitante() {
        return golesVisitante;
    }

    public void setGolesVisitante(String golesVisitante) {
        this.golesVisitante = golesVisitante;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
}


