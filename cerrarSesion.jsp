<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="es-MX">
  <head>
    <title>Cerrar Sesion</title>
    <meta charset="UTF-8">
  </head>
 <body>
  <%
      //obtenemos el usuario
      session.setAttribute("correo","");
      //obtenemos la contraseña
      session.setAttribute("contraseña","");
      //cerramos la sesion actual del usuario
      session.invalidate();
      //regresamos al login
      response.sendRedirect("login.jsp");

  %>
 </body>
</html>
