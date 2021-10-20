package modelo;

public class Usuario {
    private int idUsuario;
    private String nombre, correo, username, passsword;
    
    public Usuario(int idUsuario, String nombre, String correo,
            String username, String password) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.correo = correo;
        this.username = username;
        this.passsword = password;       
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuarios) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasssword() {
        return passsword;
    }

    public void setPasssword(String passsword) {
        this.passsword = passsword;
    }
}
