package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EquipoDAO {
    Connection conexion;
    public EquipoDAO() { //throws ClassNotFoundException {
        Conexion con = new Conexion();
        conexion = con.getConexion();
    }
    
    public List<Equipo> listarEquipo() {
        PreparedStatement ps;
        ResultSet rs;
        List<Equipo> lista = new ArrayList<>();
     
        try {
            ps = conexion.prepareStatement("SELECT * FROM equipos");
            rs = ps.executeQuery();
            
            while (rs.next()) {
                int idEquipo = rs.getInt("id_equipos");
                System.out.println(rs.getString("id_equipos"));
                String nombreEquipo = rs.getString("nombre");
                System.out.println(rs.getString("nombre"));
                Equipo equipo = new Equipo(idEquipo, nombreEquipo);
                lista.add(equipo);
            }
            return lista;
        }
        catch(SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }
}
