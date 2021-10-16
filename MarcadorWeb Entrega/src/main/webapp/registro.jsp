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
        <link rel="icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <header class="site-header">
        </header>
        <div class="hero">
            <div class="contenedor-hero">
                <section class="form-register">
                    <h4>Formulario de Registro</h4>
                        <form action="MarcadoresController?accion=registrar" method="POST" autocomplete="off">
                            <input class="controls" type="text" name="nombre"
                                id="nombre" placeholder="Nombre y Apellido">
                            <input class="controls" type="email" name="correo"
                                id="correo" placeholder="Correo electrónico">
                            <input class="controls" type="text" name="username"
                                id="username" placeholder="Usuario">
                            <input class="controls" type="password" name="password1"
                                id="password1" placeholder="Password">
                            <input class="controls" type="password" name="password"
                                id="password" placeholder="Confirmar Password">
                            <input class="botons" type="submit" value="Registrar">
                        </form>
                    <p>
                        <a href="MarcadoresController?accion=login"> Ya tengo cuenta</a>
                    </p>
                </section>
            </div>
        </div>
    </body>
</html>