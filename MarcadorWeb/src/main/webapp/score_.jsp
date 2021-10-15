<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                <div>
                    <a href="admin.html" class="botton"> Actualizar marcador
                    </a>
                </div>
                <c:forEach var="fechas" items="${listaFecha}" varStatus="statusFecha"> 
                <table class="tabla">
                    <!--<tr>
                        <th colspan="5">
                            RESULTADOS PARTIDOS
                        </th>
                    </tr>!-->
                    
                    <thead>
                    
                    <tr>
                        
                        <td>&nbsp;</td>
                        <td>LOCAL</td>
                        <th colspan="2" >
                            <input type="text" id="fech" name="fech"
                                value="<c:out value="${fechas.fecha}"/>" readonly>
                        </th>
                        <td>VISITANTE</td>
                    </tr>
                    </thead>
                    <tbody>    
                    <c:forEach var="marcadores" items="${listaMarcador}" varStatus="statusMarcador">    
                    <tr>
                            <c:if test = "${fechas.fecha} == ${marcadores.fecha}">
                            <td>
                                <form action="">
                                    <input type="radio" id="partido" name="partido"
                                        value="">
                                </form>
                            </td>
                            <td>
                                <c:forEach var = "equipos" items= "${listaEquipo}">
                                    <c:if test = "${marcadores.local}.equals(${equipos.idEquipo})">
                                    <input type="text" id="local" name="local"
                                        value="<c:out value="${equipos.nombreEquipo}"/>" readonly>
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>        
                                <c:set var = "gLocal" scope = "session" value = "${''}"/>
                                <c:if test = "${marcadores.golesLocal} != null">
                                    <c:set var = "gLocal" scope = "session" value = "${marcadores.golesLocal}"/>
                                </c:if>
                                <input type="text" id="goles_local"
                                    name="goles_local" value="<c:out value = "${gLocal}"/>" readonly>
                            </td>        
                            <td>        
                                <c:set var = "gVisitante" scope = "session" value = "${''}"/>
                                <c:if test = "${marcadores.golesVisitante} != null">
                                    <c:set var = "gVisitante" scope = "session" value = "${marcadores.golesVisitante}"/>
                                </c:if>
                                <input type="text" id="goles_visitante"
                                    name="goles_visitante" <c:out value = "${gVisitante}"/>" readonly>
                            </td>        
                            <td>        
                                <c:forEach var = "equipos" items= "${listaEquipo}">
                                    <c:if test = "${marcadores.visitante} == ${equipos.idEquipo}">
                                        <input type="text" id="visitante" name="visitante"
                                            value="<c:out value="${equipos.nombreEquipo}"/>" readonly>
                                    </c:if>
                                </c:forEach>
                            </td>
                            </c:if>
                        </tr>
                        
                    <tbody>
                        </c:forEach>
                        
                </table>
                </c:forEach>
            </section>

        </body>

    </html>