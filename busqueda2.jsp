<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
    <html lang="es-MX" >
          <head>
            <title>JSP buscar datos</title>
            <meta charset="UTF-8">
          </head>
        <body>
           <form action="resultado.jsp" method="get">
           <span> Buscar por nombre:</span><br>
           <input type="text" name="bsca" value=" " placeholder="Ejemplo: Barcel" autofocus required>
           <br><br>
           <input type="submit" value="buscar">
           </form>
        </body>
     </html>
