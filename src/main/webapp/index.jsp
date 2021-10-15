<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marcadores Online</title>
    </head>
    <body>
        <h1>Marcadores</h1>
        <a href="">Nuevo registro</a>

<!--        <br> <br>
        <table border="1" width="80%">
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Usuario</th>
                    <th>Local</th>
                    <th>Visitante</th>
                    <th>Fecha</th>
                    <th>Goles Local</th>
                    <th>Goles Visitante</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>-->
            <%--<c:forEach var="marcador" items="${lista}">--%>
                    <!--<tr>
                        <td>-->
                            <%--<c:out value="${marcador.id}"/>
                            <c:out value="${marcador.idUsuario}"/>
                            <c:out value="${marcador.local}"/>
                            <c:out value="${marcador.visitante}"/>
                            <c:out value="${marcador.golesLocal}"/>
                             <c:out value="${marcador.golesVisitante}"/>
                             <c:out value="${marcador.fecha}"/>--%>
                        <!--</td>
                    </tr>-->
                <%--</c:forEach>--%>
            <!--</tbody>
        </table>-->
        
        <br> <br>
        <table border="1" width="80%">
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Correo</th>
                    <th>Nombre de Usuario</th>
                    <th>Contraseña</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="usuario" items="${lista}">
                    <tr>
                        <td><c:out value="${usuario.idUsuarios}"/></td>
                        <td><c:out value="${usuario.nombre}" /></td>
                        <td><c:out value="${usuario.correo}" /></td>
                        <td><c:out value="${usuario.username}" /></td>
                        <td><c:out value="${usuario.passsword}" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br>
        <%--<c:out value="${salida}"/>--%>
        
        
        <br>
                <%--<% String salida = String.valueOf(request.getAttribute("salida"));
                if (salida == null || salida.isEmpty()) {
                    salida = "";
                }
                %>--%>
                <%
                    String salida = "";
                    if (request.getAttribute("salida") != null) {
                        salida = request.getAttribute("salida").toString();
                    }
                %>
                <p><%= salida %></p>
                <br>
    </body>
</html>
