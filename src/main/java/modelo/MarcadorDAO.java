package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MarcadorDAO {
    Connection conexion;
    public MarcadorDAO() { //throws ClassNotFoundException {
        Conexion con = new Conexion();
        conexion = con.getConexion();
    }
    
    public List<Marcador> listarMarcador() {
        PreparedStatement ps;
        ResultSet rs;
        List<Marcador> lista = new ArrayList<>();
     
        try {
            ps = conexion.prepareStatement("SELECT * FROM partidos ORDER BY fecha ASC");
            rs = ps.executeQuery();
            
            while (rs.next()) {
                int idPartidos = rs.getInt("id_partidos");
                int idUsuario = rs.getInt("id_usuario");
                int local = rs.getInt("local");
                int visitante = rs.getInt("visitante");
                Date fecha = rs.getDate("fecha");
                String golesLocal = rs.getString("goles_local");
                String golesVisitante = rs.getString("goles_visitante");               
                Marcador marcador = new Marcador(idPartidos, idUsuario, local,
                        visitante, fecha, golesLocal, golesVisitante);
                lista.add(marcador);
            }
            return lista;
        }
        catch(SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }
    
    public List<Fecha> listarFecha() {
        PreparedStatement ps;
        ResultSet rs;
        List<Fecha> lista = new ArrayList<>();
     
        try {
            ps = conexion.prepareStatement("SELECT DISTINCT(fecha) AS fecha FROM partidos ORDER BY fecha ASC");
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Date fecha = rs.getDate("fecha");
                Fecha fechas = new Fecha(fecha);
                lista.add(fechas);
            }
            return lista;
        }
        catch(SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }
    
    public Marcador mostrarMarcador(int _id) {
        PreparedStatement ps;
        ResultSet rs;
        Marcador marcador = null;
     
        try {
            ps = conexion.prepareStatement("SELECT * FROM partidos WHERE id_partidos=?");
            ps.setInt(1, _id);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                int idPartidos = rs.getInt("id_partidos");
                int idUsuario = rs.getInt("id_usuario");
                int local = rs.getInt("local");
                int visitante = rs.getInt("visitante");
                Date fecha = rs.getDate("fecha");
                String golesLocal = rs.getString("goles_local");
                String golesVisitante = rs.getString("goles_visitante");               
                marcador = new Marcador(idPartidos, idUsuario, local,
                        visitante, fecha, golesLocal, golesVisitante);
            }
            return marcador;
        }
        catch(SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }
    
    public boolean insertar(Marcador marcador) {
        PreparedStatement ps;
     
        try {
            ps = conexion.prepareStatement("INSERT INTO partidos (id_usuario,"
                    + " local, visitante, fecha, goles_local, goles_visitante)"
                    + " VALUES (?, ?, ?, ?, ?, ?)");
            ps.setInt(1, marcador.getIdUsuario());
            ps.setInt(2, marcador.getLocal());
            ps.setInt(3, marcador.getVisitante());
            ps.setDate(4, marcador.getFecha());
            ps.setString(5, marcador.getGolesLocal());
            ps.setString(6, marcador.getGolesVisitante());
            ps.execute();
            
            return true;
        }
        catch(SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }
    
    public boolean insertarSinMarcador(Marcador marcador) {
        PreparedStatement ps;
     
        try {
            ps = conexion.prepareStatement("INSERT INTO partidos (id_usuario,"
                    + " local, visitante, fecha)"
                    + " VALUES (?, ?, ?, ?)");
            ps.setInt(1, marcador.getIdUsuario());
            ps.setInt(2, marcador.getLocal());
            ps.setInt(3, marcador.getVisitante());
            ps.setDate(4, marcador.getFecha());
            ps.execute();
            
            return true;
        }
        catch(SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }
    
    public boolean actualizar(int idPartido, String golesLocal, String golesVisitante) {
        PreparedStatement ps;
     
        try {
            ps = conexion.prepareStatement("UPDATE partidos SET goles_local = ?, "
                    + " goles_visitante = ? WHERE id_partidos = ?");
            ps.setString(1, golesLocal);
            ps.setString(2, golesVisitante);
            ps.setInt(3, idPartido);
            ps.execute();

            return true;
        }
        catch(SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }
    
    public boolean eliminar(int _id) {
        PreparedStatement ps;
     
        try {
            ps = conexion.prepareStatement("DELETE FROM partidos WHERE id=?");
            ps.setInt(1, _id);
            ps.execute();
            
            return true;
        }
        catch(SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }
}
