package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion {
    public Connection getConexion() { //throws ClassNotFoundException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ciclo3?serverTimezone=UTC", "proyecto", "Marcadores*c3");
            System.out.println("Conexión exitosa");
            return conexion;
        }
        catch (SQLException e) {
            System.out.println(e.toString());
            return null;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
