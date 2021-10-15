<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marcadores</title>
    </head>
    <body>
        <h2>Nuevo registro</h2>
        <br><br>        
        <form action="" method="POST" autocomplete="off">
            <p>
                Local:
                <input id="local" name="local" type="text">
            </p>
            <p>
                Visitante:
                <input id="visitante" name="visitante" type="text">
            </p>
             <p>
                Fecha:
                <input id="fecha" name="fecha" type="text">
            </p>           
            <p>
                Goles Local:
                <input id="goleslocal" name="goleslocal" type="text">
            </p>
            <p>
                Visitante:
                <input id="golesvisitante" name="golesvisitante" type="text">
            </p>
            <button id="guardar" name="guardar" type="submit">Guardar</button>
        </form>
    </body>
</html>
