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
        <link rel="stylesheet" href="css/admin.css">
        <link rel="icon" href="img/favicon.ico" type="image/x-icon">        
    </head>
    <body>
        <nav class="banner">
            <a class="logo">
                <a href="main.jsp"> 
                    <img  src="img/logo.png" alt="">
                </a>
            </div>
        </nav>
        <script>
            window.onload = function() {
                var fecha = new Date(); //Fecha actual
                var mes = fecha.getMonth() + 1; //obteniendo mes
                var dia = fecha.getDate(); //obteniendo dia
                var anho = fecha.getFullYear(); //obteniendo año
                if (dia < 10)
                    dia = '0' + dia; //agrega cero si el menor de 10
                if (mes < 10)
                    mes = '0' + mes; //agrega cero si el menor de 10
                document.getElementById('fecha').value = anho + "-" + mes + "-" + dia;
            }
        </script>
        <section class="container-form">
            <h1> REGISTRAR PARTIDOS </h1>
            <div class="site-table">
                <table class="tabla">                    
                    <tr>
                        <td>Seleccione la fecha del partido</td>
                        <td>Seleccione el equipo local</td>
                        <td>Marcador</td>
                        <td>Seleccione el equipo visitante</td>
                        <td>Marcador</td>
                    </tr>
                    <tr>
                        <form action="MarcadoresController?accion=registrarPartido" id="registrarPartidos" method="POST">
                            <th>
                                <input class="fecha" type="date" name="fecha" id="fecha" value="">
                            </th>
                            <td class="tabla1">
                                <select name="local" id="local">
                                    <option value="0">Elegir equipo local</option>
                                    <c:forEach var="equipo" items="${lista}">
                                    <option value="<c:out value="${equipo.idEquipo}" />">
                                        <c:out value="${equipo.nombreEquipo}"/>
                                    </option>
                                    </c:forEach>
                                </select>                               
                            </td>
                            <td>                            
                                <input type="number" name="goles_local" size="3" maxlength="2"></td>
                            </td>
                            <td class="tabla2">
                                <select name="visitante" id="visitante">
                                    <option value="0">Elegir equipo visitante</option>
                                    <c:forEach var="equipo" items="${lista}">
                                    <option value="<c:out value="${equipo.idEquipo}"/>">
                                        <c:out value="${equipo.nombreEquipo}"/>
                                    </option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td>
                                <input type="number" name="goles_visitante" size="3" maxlength="2">
                            </td>  
                        </tr>
                        <tr colspan="5" align="center">
                            <th class="botones">
                                <input type="hidden" name="regPartido" id="regPartido" value="Prueba">
                                <input type="submit" value="Guardar" id="guardar" onclick="ValidaEnvia()">
                                <input type="submit" value="Guardar y Salir" id="guardarSalir" onclick="ValidaEnviar()">                              
                            </th> 
                            <script>           
                                function ValidaEnvia() {
                                    document.getElementById("regPartido").value = "Prueba";
                                    if(document.getElementById("local").selectedIndex === 0){
                                        alert("Debe seleccionar un equipo local");
                                        document.getElementById("local").focus();
                                        return false;
                                    }

                                    if(document.getElementById("visitante").selectedIndex === 0){
                                        alert("Debe seleccionar un equipo visitante");
                                        document.getElementById("visitante").focus();
                                        return false;
                                    }

                                    if (document.getElementById("local").selectedIndex === document.getElementById("visitante").selectedIndex) {
                                        alert("El equipo local es igual al equipo visitante");
                                        document.getElementById("local").focus();
                                        return false;
                                    }
                                    else {
                                        document.getElementById("regPartido").value = "Guardar";
                                        this.submit();
                                    }
                                }

                                function ValidaEnviar() {
                                    document.getElementById("regPartido").value = "Prueba";
                                    if(document.getElementById("local").selectedIndex === 0) {
                                        alert("Debe seleccionar un equipo local");
                                        document.getElementById("local").focus();
                                        return false;
                                    }

                                    if(document.getElementById("visitante").selectedIndex === 0) {
                                        alert("Debe seleccionar un equipo visitante");
                                        document.getElementById("visitante").focus();
                                        return false;
                                    }

                                    if (document.getElementById("local").selectedIndex === document.getElementById("visitante").selectedIndex) {
                                        alert("El equipo local es igual al equipo visitante");
                                        document.getElementById("local").focus();
                                        return false;
                                    }
                                    else {
                                        document.getElementById("regPartido").value = "GuardarSalir";
                                        this.submit();
                                    }                            
                                }
                            </script>
                        </form>
                    </tr>                       
                </table>
            </div>
        </section>
    </body>   
</html>
