package controlador;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Equipo;
import modelo.EquipoDAO;
import modelo.Fecha;
import modelo.Marcador;
import modelo.MarcadorDAO;
import modelo.Usuario;
import modelo.UsuarioDAO;

@WebServlet(name = "MarcadoresController", urlPatterns = {"/MarcadoresController"})
public class MarcadoresController extends HttpServlet {
    public int user = 0;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EquipoDAO equipoDAO = new EquipoDAO();
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        MarcadorDAO marcadorDAO = new MarcadorDAO();
        String accion;
        String salida = "";
        System.out.println("Está en MarcadoresController");
        //int user = 0;
        RequestDispatcher dispatcher = null;
        accion = request.getParameter("accion");
        System.out.println("Acción: " +accion);
        if (accion == null || accion.isEmpty()) {
            request.setAttribute("salida", salida);
            dispatcher = request.getRequestDispatcher("login.jsp");
        }
        else if ("registro".equals(accion)) {
            dispatcher = request.getRequestDispatcher("registro.jsp");
        }
        else if ("ingresar".equals(accion)) {
            String usernam = request.getParameter("username");
            String passwd = request.getParameter("password");
            System.out.println("Nombre de Usuario: " + usernam);
            System.out.println("Contraseña: " + passwd);
            salida = "El nombre de usuario o la contraseña son incorrectos";
            dispatcher = request.getRequestDispatcher("login.jsp");
            
            if (usuarioDAO.consultarUsuario(usernam) != null) {
                Usuario usuario = usuarioDAO.consultarUsuario(usernam);
                System.out.println("Diferente de null");
                String nombreUsuario = usuario.getUsername();
                String passw = usuario.getPasssword();
            
                if ((nombreUsuario != null) && (passw != null) &&
                    (usernam.equals(nombreUsuario)) && (passwd.equals(passw))) {
                    System.out.println("Login exitoso");
                    salida = "Login correcto";
                    //Dispatcher hacia la página siguiente
                    user = usuarioDAO.consultarUsuario(usernam).getIdUsuario();
                    request.setAttribute("user", user);
                    System.out.println("Usuario: " + user);
                    getServletContext().setAttribute("usr", user);
                    System.out.println("Usuario ServletContext: " + getServletContext().getAttribute("usr"));
                    request.setAttribute("salida", salida);
                    dispatcher = request.getRequestDispatcher("main.jsp");
                }
                else {
                    System.out.println("Error en el Login");
                }
            }
            else {
                System.out.println("Error en el Login");
                
            }
            request.setAttribute("salida", salida);
        }
        else if ("registrar".equals(accion)) {
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            Usuario usuario = new Usuario(0, nombre, correo, username, password);
            usuarioDAO.insertar(usuario);
            salida = "Registro correcto, ahora ingrese con sus credenciales";
            request.setAttribute("salida", salida);
            dispatcher = request.getRequestDispatcher("login.jsp");
        }
        else if ("login".equals(accion)) {
            request.setAttribute("salida", salida);
            dispatcher = request.getRequestDispatcher("login.jsp");
        }
        else if ("formRegistrarPartido".equals(accion)) {
            List<Equipo> listaEquipo = equipoDAO.listarEquipo();
            request.setAttribute("lista", listaEquipo);
            request.setAttribute("salida", salida);
            dispatcher = request.getRequestDispatcher("admin.jsp");
        }
        else if ("registrarPartido".equals(accion)) {
            //int usuario = Integer.parseInt(request.getParameter("user"));
            System.out.println("Valor regPartido: " + request.getParameter("regPartido"));
            if (request.getParameter("regPartido").equals("Prueba")) {
                salida = "Debe digitar los datos correctamente!";
                dispatcher = request.getRequestDispatcher("MarcadoresController?accion=formRegistrarPartido");
            }
            else {
                int usr = (Integer)(getServletContext().getAttribute("usr"));
                int local = 0;
                int visitante = 0;
                String golesLocal;
                String golesVisitante;
                if (request.getParameter("local") != null) {
                    local = Integer.parseInt(request.getParameter("local"));
                }
                if (request.getParameter("visitante") != null) {
                    visitante = Integer.parseInt(request.getParameter("visitante"));
                }
                Date fecha = Date.valueOf(request.getParameter("fecha"));
                golesLocal = request.getParameter("goles_local");
                golesVisitante = request.getParameter("goles_visitante");

                Marcador marcador = new Marcador(0, usr, local, visitante, fecha, golesLocal, golesVisitante);
                if (golesLocal != null && golesVisitante != null) {
                    if (marcadorDAO.insertar(marcador)) {
                        salida = "Partido registrado correctamente!";
                        System.out.println(salida);
                    }
                }
                else {
                    if (marcadorDAO.insertarSinMarcador(marcador)) {
                        salida = "Partido registrado correctamente!";
                        System.out.println(salida);
                    }
                }
                if (request.getParameter("regPartido").equals("Guardar")) {
                    dispatcher = request.getRequestDispatcher("MarcadoresController?accion=formRegistrarPartido");
                }
                else {
                    dispatcher = request.getRequestDispatcher("main.jsp");
                }
            }          
            request.setAttribute("salida", salida);
            System.out.println("Valor regPartido: " + request.getParameter("regPartido"));           
        }
        else if ("marcadores".equals(accion)) {
            List<Marcador> listaMarcador = marcadorDAO.listarMarcador();
            List<Equipo> listaEquipo = equipoDAO.listarEquipo();
            List<Fecha> listaFecha = marcadorDAO.listarFecha();
            request.setAttribute("listaMarcador", listaMarcador);
            request.setAttribute("listaEquipo", listaEquipo);
            request.setAttribute("listaFecha", listaFecha);
            request.setAttribute("salida", salida);
            dispatcher = request.getRequestDispatcher("score.jsp");
        }
        else if ("actualizarMarcador".equals(accion)) {
            int idPartido = Integer.valueOf(request.getParameter("partido"));
            System.out.println("Id Partido: " + idPartido);
            String golesLocal = request.getParameter("goles_local");
            System.out.println("Goles Local: " + request.getParameter("goles_local"));
            String golesVisitante = request.getParameter("goles_visitante");
            System.out.println("Goles Visitante: " + request.getParameter("goles_visitante"));

            if (marcadorDAO.actualizar(idPartido, golesLocal, golesVisitante)) {
                salida = "Marcador actualizado correctamente";
            }
            else {
                salida = "Ocurrió un error al actualizar el Marcador";
            }
            System.out.println("Salida: " + salida);
            request.setAttribute("salida", salida);
            dispatcher = request.getRequestDispatcher("MarcadoresController?accion=marcadores");
        }
        else {
            request.setAttribute("salida", salida);
            dispatcher = request.getRequestDispatcher("login.jsp");
        }
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
