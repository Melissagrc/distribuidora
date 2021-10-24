<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="es-MX" >
<head>
<link type="text/css" href="estiloFormularioPrincipal.css" rel="stylesheet">
<title>Formulario de acceso</title>
<meta charset="UTF-8">
</head>
<body>

  <header></header>
  <br>

  <div class="form">

        <h1>¡Bienvenido!</h1><br><br>

    <div>


    <form action="validar.jsp" method="get">

      <div class="campo">
        <span>
          <h4>Correo*</h4>
        </span>
        <input type="email" pattern="[A-Za-z0-9_-@]{1,15}" placeholder="Escribe tu correo" name="correo"/>
      </div>

      <div class="campo">
        <span>
          <h4>Contraseña*</h4>
        </span>
        <input type="password" pattern="[A-Za-z0-9]{1,15}" placeholder="Escribe tu contraseña" name="contraseña"/>
      </div>

      <button type="submit" class="button button-block">Iniciar Sesión</button>
    </form>
    </div>
  </div>


</body>
</html>
