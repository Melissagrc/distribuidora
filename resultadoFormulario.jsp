<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="es-MX" >
<head>
<title>JSP con acceso a base de datos</title>
<meta charset="UTF-8">
</head>
<body>
    <%! Connection con;
        Statement stmt;
        ResultSet rs;
        String dburl="jdbc:postgresql://localhost:5432/surtibotana";
        String user="melissa";
        String password="usermelissapass";
    %>
    <% Class.forName("org.postgresql.Driver");
      con = DriverManager.getConnection(dburl,user,password);
      stmt = con.createStatement();
      String Validar ="";
      String DatoUsuario =""; //creando variable string para los datos de inicio de sesión
      String DatoPassword="";
    %>

    <%
      /* recuperando datos del formulario para iniciar sesión*/
      request.setCharacterEncoding("UTF-8"); //recuperar en UTF-8
      //capturando en variable java el valor de la caja de user y de contraseña del formulario
      DatoUsuario =request.getParameter("user");
      DatoPassword = request.getParameter("contraseña");
      //Generando la consulta el nombre dado en el formulario
      // El + ayuda a obtener el valor de la variable java
    %>

    <%
      try{
        Validar = "select usuario,password from usuarios where user ='"+DatoUsuario+"' && contraseña ='"+DatoPassword+"'";
        rs=stmt.executeQuery(Validar);
      if(rs.next()) {
      String Rusuario = rs.getString("usuario");
      String Rpassword = rs.getString("password");

      }else{
        System.out.println("Usuario o contraseña no válida");
      }
      con.close(); //nunca olvidar cerrar nuestra conexión
      }catch(Exception e){
      System.out.println("Error:"+ e);
      } //fin del try/catch
    %>

  </body>
</html>
