<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.regex.*"%>
<!DOCTYPE html>
<html lang="es-MX" >
<head>
<link type="text/css" href="estilo.css" rel="stylesheet">
<title>JSP con acceso a base de datos</title>
<meta charset="UTF-8">
  <style type="text/css">
    h2{
      margin-left: 550px;
      height: 100px;
      width: 450px;
      border: 3px solid;
      border-radius: 7px;
    }
  </style>
</head>
<body>

  <header class="header"></header>


<%! Connection con;
    Statement stmt;
    ResultSet rs;
    String dburl="jdbc:postgresql://localhost:5432/surtibotana";
    String user="rodrigo";
    String password="userxrodrigopass";
%>
<% Class.forName("org.postgresql.Driver");
    con = DriverManager.getConnection(dburl,user,password);
    stmt = con.createStatement();
    String Nid_producto;
    String Nsabor ="";
    String Ntamanio ="";
    String Actualiza = "";
%>

<br> <br> <br>

<%
    Pattern pattern1=Pattern.compile("^[0-9.]+$");
    Pattern pattern2=Pattern.compile("^[A-Za-z]+$");
    Pattern pattern3=Pattern.compile("^[A-Za-z0-9]+$");
%>

<%
    int valido=0;

    /* recuperando datos del formulario */
    request.setCharacterEncoding("UTF-8");

    Nid_producto=request.getParameter("id_producto");
    Matcher matcher=pattern1.matcher(Nid_producto);
        if(matcher.find()==true){
          valido++;
        }else{

        }

    Nsabor=request.getParameter("sabor");
    Matcher matcher1=pattern2.matcher(Nsabor);
        if(matcher1.find()==true){
          valido++;
        }else{

        }

    Ntamanio=request.getParameter("tamanio");
    Matcher matcher2=pattern3.matcher(Ntamanio);
        if(matcher2.find()==true){
          valido++;
        }else{

        }

%>

<%
  if(valido==3){
    //Generando la actualización con el nombre dado en el formulario
    Actualiza = "update producto set sabor =?,tamanio=? where id_producto = "+Nid_producto+"";
    PreparedStatement pstm=con.prepareStatement(Actualiza);
    pstm.setString(1,Nsabor);
    pstm.setString(2,Ntamanio);
    //generando actualización en la Base de datos
    pstm.executeUpdate();
    pstm.close(); //Cerrando conexión con el servidor de Base de Datos
  }else{
      out.println("<script>alert('Datos inválidos')</script>");
      //out.print(valido);
  }

  con.close();

%>

<br><br><br><br><br><br><br><br><br><br><br>
  <h2 align="center"><br>Producto actualizado exitosamente</h2>

</body>
</html>
