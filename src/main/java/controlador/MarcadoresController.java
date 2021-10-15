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
        //int user = 0;
        RequestDispatcher dispatcher = null;
        accion = request.getParameter("accion");
        if (accion == null || accion.isEmpty()) {
            request.setAttribute("salida", salida);
            dispatcher = request.getRequestDispatcher("login.jsp");
        }
        else if ("registro".equals(accion)) {
            dispatcher = request.getRequestDispatcher("registro.jsp");
            //dispatcher.forward(request, response);
        }
        else if ("ingresar".equals(accion)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if ((username.equals(usuarioDAO.consultarUsuario(username).getUsername()))
                    && (password.equals(usuarioDAO.consultarUsuario(username).getPasssword()))) {
                System.out.println("Login exitoso");
                salida = "Login correcto";
                //Dispatcher hacia la página siguiente
                user = usuarioDAO.consultarUsuario(username).getIdUsuario();
                request.setAttribute("user", user);
                System.out.println("Usuario: " + user);
                getServletContext().setAttribute("usr", user);
                System.out.println("Usuario ServletContext: " + getServletContext().getAttribute("usr"));
                request.setAttribute("salida", salida);
                dispatcher = request.getRequestDispatcher("main.jsp");
            }
            else {
                salida = "El nombre de usuario o la contraseña son incorrectos";
                System.out.println("Error en el Login");
                request.setAttribute("salida", salida);
                dispatcher = request.getRequestDispatcher("login.jsp");
            }
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
            request.setAttribute("salida", salida);
            dispatcher = request.getRequestDispatcher("admin.jsp");
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
