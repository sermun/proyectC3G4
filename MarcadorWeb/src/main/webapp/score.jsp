<%@page import="modelo.Fecha"%>
<%@page import="modelo.Equipo"%>
<%@page import="modelo.Marcador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Marcadores Online</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
            rel="stylesheet">
        <link rel="stylesheet"
            href="https://necolas.github.io/normalize.css/8.0.0/normalize.css">
        <link rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
            integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
            crossorigin="anonymous">
        <link rel="stylesheet" href="css/score.css">
    </head>

    <body>
        <header class="site-header">
        </header>
        <nav class="banner">
            <div class="escudos">
                <img src="img/escudos.png" alt="">
            </nav>

            <section class="container">
                <div class="site-table">
                <table class="tabla">
                    <thead>
                        <tr>
                            <th colspan="5">
                                RESULTADOS PARTIDOS
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        List<Equipo> listEquipo = new ArrayList<Equipo>();
                        List<Marcador> listMarcador = new ArrayList<Marcador>();
                        List<Fecha> listFecha = new ArrayList<Fecha>();
                        
                        if (request.getAttribute("listaMarcador") != null && 
                                request.getAttribute("listaEquipo") != null &&
                                request.getAttribute("listaFecha") != null) {
                            listMarcador = (List<Marcador>)request.getAttribute("listaMarcador");
                            listEquipo = (List<Equipo>)request.getAttribute("listaEquipo");
                            listFecha = (List<Fecha>)request.getAttribute("listaFecha");
                            int tMarcador = listMarcador.size();
                            int tEquipo = listEquipo.size();
                            int tFecha = listFecha.size();
                            for (int i = 0; i < tFecha; i++) {
                    %>
                                <tr>
                                    <td>Editar</td>
                                    <td>LOCAL</td>
                                    <th colspan="2" >
                                        <input type="text" id="fechas" name="fechas"
                                            value="<%= listFecha.get(i).getFecha().toString() %>" readonly>
                                    </th>
                                    <td>VISITANTE</td>
                                </tr>
                    <%          
                                for (int j = 0; j < tMarcador; j++) {
                                    if (listMarcador.get(j).getFecha().equals(listFecha.get(i).getFecha())) {
                    %>
                                        <tr>
                                            <td>
                                                <form action="MarcadoresController?accion=actualizarMarcador" method="POST" autocomplete="off" name="formulario<%= listMarcador.get(j).getIdPartido() %>" id="formulario<%= listMarcador.get(j).getIdPartido() %>">
                                                    <input type="radio" id="partido<%= listMarcador.get(j).getIdPartido() %>" name="partido"
                                                        value="<%= listMarcador.get(j).getIdPartido() %>" onclick="on<%= listMarcador.get(j).getIdPartido() %>()">                                               
                                            </td>
                                            
                                            <td>
                    <%
                                                for (int k = 0; k < tEquipo; k++) {
                                                    if (listMarcador.get(j).getLocal() == listEquipo.get(k).getIdEquipo()) {
                    %>
                                                        <input type="text" id="local" name="local"
                                                            value="<%= listEquipo.get(k).getNombreEquipo() %>" readonly>
                                            </td>
                                            <td> 
                    <%
                                                    }
                                                }
                                                String gLocal = "";
                                                String gVisitante ="";
                                                if (listMarcador.get(j).getGolesLocal() != null) {
                                                    gLocal = listMarcador.get(j).getGolesLocal();
                                                }
                                                if (listMarcador.get(j).getGolesVisitante() != null) {
                                                    gVisitante = listMarcador.get(j).getGolesVisitante();
                                                }
                    %>
                                                <input type="text" id="goles_local<%= listMarcador.get(j).getIdPartido() %>"
                                                       name="goles_local" value="<%= gLocal %>" disabled="true">
                                            </td>        
                                            <td>
                                                <input type="text" id="goles_visitante<%= listMarcador.get(j).getIdPartido() %>"
                                                    name="goles_visitante" value="<%= gVisitante %>" disabled="true">
                                            </td>        
                                            <td>
                    <%
                                                for (int k = 0; k < tEquipo; k++) {
                                                    if (listMarcador.get(j).getVisitante() == listEquipo.get(k).getIdEquipo()) {
                    %>
                                                        <input type="text" id="visitante" name="visitante"
                                                            value="<%= listEquipo.get(k).getNombreEquipo() %>" readonly>
                                            </td>
                                            <td>
                                                <input type="submit" id="actualizar<%= listMarcador.get(j).getIdPartido() %>" value="Actualizar" style="display: none" onsubmit="off<%= listMarcador.get(j).getIdPartido() %>()">
                                            </td>
                                            <td>
                                                <input type="button" id="cancelar<%= listMarcador.get(j).getIdPartido() %>" value="Cancelar" style="display: none" onclick="of<%= listMarcador.get(j).getIdPartido() %>()">
                                            </td>
                                            <script>
                                                function on<%= listMarcador.get(j).getIdPartido() %>() {
                                                    if ((document.getElementById("goles_local<%= listMarcador.get(j).getIdPartido() %>").value.length === 0) &
                                                    (document.getElementById("goles_visitante<%= listMarcador.get(j).getIdPartido() %>").value.length === 0)) {
                                                        if ((document.getElementById("goles_local<%= listMarcador.get(j).getIdPartido() %>").disabled = false) &
                                                        (document.getElementById("goles_visitante<%= listMarcador.get(j).getIdPartido() %>").disabled = false) &
                                                        (document.getElementById("actualizar<%= listMarcador.get(j).getIdPartido() %>").style.display = "inline") &
                                                        (document.getElementById("cancelar<%= listMarcador.get(j).getIdPartido() %>").style.display = "inline")) {
                                                            document.getElementById("goles_local<%= listMarcador.get(j).getIdPartido() %>").focus();
                                                            document.getElementById("goles_visitante<%= listMarcador.get(j).getIdPartido() %>").focus();
                                                            return true;
                                                        }
                                                        else {
                                                            return false;
                                                        }
                                                    }
                                                    else {
                                                        document.getElementById("partido<%= listMarcador.get(j).getIdPartido() %>").checked = false;
                                                    }
                                                }

                                                function off<%= listMarcador.get(j).getIdPartido() %>() {                                                     
                                                    if ((document.getElementById("goles_local<%= listMarcador.get(j).getIdPartido() %>").disabled = true) &
                                                    (document.getElementById("goles_visitante<%= listMarcador.get(j).getIdPartido() %>").disabled = true)) {
                                                        document.getElementById("actualizar<%= listMarcador.get(j).getIdPartido() %>").style.display = "none";
                                                        document.getElementById("cancelar<%= listMarcador.get(j).getIdPartido() %>").style.display = "none";
                                                        document.getElementById("partido<%= listMarcador.get(j).getIdPartido() %>").checked = false;
                                                    }
                                                    else {
                                                        return;
                                                    }
                                                    this.submit();
                                                }
                                                
                                                function of<%= listMarcador.get(j).getIdPartido() %>() {                                                     
                                                    if ((document.getElementById("goles_local<%= listMarcador.get(j).getIdPartido() %>").disabled = true) &
                                                    (document.getElementById("goles_visitante<%= listMarcador.get(j).getIdPartido() %>").disabled = true)) {
                                                        document.getElementById("actualizar<%= listMarcador.get(j).getIdPartido() %>").style.display = "none";
                                                        document.getElementById("cancelar<%= listMarcador.get(j).getIdPartido() %>").style.display = "none";
                                                        document.getElementById("partido<%= listMarcador.get(j).getIdPartido() %>").checked = false;
                                                    }
                                                    else {
                                                        return;
                                                    }
                                                }
                                            </script>
                                        </tr>
                    <%
                                                    }
                                                }
                                    }
                                }
                            }
                        }
                    %>
                                                </form>
                    </tbody>
                </table>
                </div>
        
        <!--<script>
            function on() {                             
                if ((document.getElementById("goles_local").disabled = false) &
                (document.getElementById("goles_visitante").disabled = false) &
                (document.getElementById("actualizar").style.display = "inline")) {
                    document.getElementById("goles_local").focus();
                    document.getElementById("goles_visitante").focus();
                    return true;
                }
                else {
                    return false;
                }
            }

            function off() {                                                     
                if ((document.getElementById("goles_local").disabled = true) &
                (document.getElementById("goles_visitante").disabled = true)) {
                    document.getElementById("actualizar").style.display = "none";
                    document.getElementById("partido").checked = false;
                }
                else {
                    return;
                }
                this.submit();
            }
        </script>-->
            </section>
        </body>
    </html>