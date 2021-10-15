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

        <link rel="stylesheet" href="css/admin.css">
        <script>
            window.onload = function() {
                var fecha = new Date(); //Fecha actual
                var mes = fecha.getMonth() + 1; //obteniendo mes
                var dia = fecha.getDate(); //obteniendo dia
                var anho = fecha.getFullYear(); //obteniendo año
                if (dia < 10)
                    dia = '0' + dia; //agrega cero si el menor de 10
                if (mes < 10)
                    mes = '0' + mes //agrega cero si el menor de 10
                document.getElementById('fecha').value = anho + "-" + mes + "-" + dia;
            }
            
            
            function Valida_envia(){
                if(document.registrarPartidos.local.selectedIndex===0){
                    alert("Debe seleccionar un equipo local");
                    document.registrarPartido.local.focus();
                    return 0;
                }

                if(document.registrarPartidos.visitante.selectedIndex===0){
                      alert("Debe seleccionar un equipo visitante");
                      document.registrarPartido.visitante.focus();
                      return 0;
                }
                
                if (document.registrarPartidos.local.selectedIndex === document.registrarPartido.visitante.selectedIndex) {
                    alert("El equipo local es igual al equipo visitante");
                    document.registrarPartido.local.focus();
                    return 0;
                }
            }

        </script>

    </head>
    <body>
      <div class="site-container">
        <header class="site-header">

        </header>
        <section class="banner">
          <div class="imagen">

          </div>
        </section>
        <body>
            <form action="MarcadoresController?accion=registrarPartido" id="registrarPartidos" method="POST">
              <p>Seleccione la fecha del partido</p>
                <input type="date" name="fecha" id="fecha" value="">
                <table>
                  <td>Seleccione el equipo local</td>
                      <tr>
                          <td><select name="local" id="local">
                        <option value="0">Elegir equipo local</option>
                        <c:forEach var="equipo" items="${lista}">                           
                          <option value="<c:out value="${equipo.idEquipo}"/>">
                              <c:out value="${equipo.nombreEquipo}"/>
                          </option>
                        </c:forEach>
                      </select>
                      </td>
                  </tr>
                  <tr>
                      <td>Marcador</td>
                      <td><input type="number" name="goles_local" size="3" maxlength="2"></td>
                  </tr>
              </table>
              <table>
                <td>Seleccione el equipo visitante</td>
                    <tr>
                    <td>
                      <select name="visitante" id="visitante">
                        <option value="0">Elegir equipo visitante</option>
                        <c:forEach var="equipo" items="${lista}">                           
                          <option value="<c:out value="${equipo.idEquipo}"/>">
                              <c:out value="${equipo.nombreEquipo}"/>
                          </option>
                        </c:forEach>
                      </select>
                    </td>
                </tr>
                <tr>
                    <td>Marcador</td>
                    <td><input type="number" name="goles_visitante" size="3" maxlength="2
                      "></td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Enviar" onclick="Valida_envia()">
                    </td>
                </tr>
            </table>
      </form>



    </body>

    </html>
