package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {
   Connection conexion;
    public UsuarioDAO() { //throws ClassNotFoundException {
        Conexion con = new Conexion();
        conexion = con.getConexion();
    }
    
    public List<Usuario> listarUsuarios() {
        PreparedStatement ps;
        ResultSet rs;
        List<Usuario> lista = new ArrayList<>();
     
        try {
            ps = conexion.prepareStatement("SELECT * FROM usuarios");
            rs = ps.executeQuery();
            
            while (rs.next()) {
                int idUsuario = rs.getInt("id_usuarios");
                String nombre = rs.getString("nombre");
                String correo = rs.getString("correo");
                String username = rs.getString("username");
                String password = rs.getString("password");              
                Usuario usuario = new Usuario(idUsuario, nombre, correo,
                    username, password);
                lista.add(usuario);
            }
            return lista;
        }
        catch(SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }
    
    public Usuario consultarUsuario(String _username) {
        PreparedStatement ps;
        ResultSet rs;
        Usuario usuario = null;
     
        try {
            ps = conexion.prepareStatement("SELECT * FROM usuarios"
                    + " WHERE username = ?");
            ps.setString(1, _username);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                int idUsuario = rs.getInt("id_usuarios");
                String nombre = rs.getString("nombre");
                String correo = rs.getString("correo");
                String username = rs.getString("username");
                String password = rs.getString("password");               
                usuario = new Usuario(idUsuario, nombre, correo,
                    username, password);
            }
            return usuario;
        }
        catch(SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }
    
    public boolean insertar(Usuario usuario) {
        PreparedStatement ps;
     
        try {
            ps = conexion.prepareStatement("INSERT INTO usuarios (nombre, correo, username, password) VALUES (?, ?, ?, ?)");
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getCorreo());
            ps.setString(3, usuario.getUsername());
            ps.setString(4, usuario.getPasssword());
            ps.execute();           
            return true;
        }
        catch(SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }
}