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

        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <div class="container">
            <section class="section"></section>
            <aside class="aside">
                <h4>BIENVENIDO A MARCADORES ONLINE</h4>
                <H2>Ingresa tus datos</H2>
                <form action="MarcadoresController?accion=ingresar" method="POST">
                    <input class="controls" type="text" name="username"
                        id="username" placeholder="Usuario">
                    <input class="controls" type="password" name="password"
                        id="password" placeholder="Password">
                    <input class="botons" type="submit" value="Ingresar">
                    
                    <!--<input type="text" name="salida" value="-->
                    
                    
                    
                    
                    <!--/> "> -->
                    
                    
                    
                </form>
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
                
                <a href="MarcadoresController?accion=registro">Registrarse</a>
            </aside>




        </div>














    </body>


</html>