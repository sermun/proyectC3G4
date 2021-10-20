
package modelo;

import java.sql.Date;

public class Fecha {
    private Date fecha;
    
    public Fecha(Date fecha) {
        this.fecha = fecha;        
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
}
