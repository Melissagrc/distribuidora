<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.regex.*"%>
<!DOCTYPE html>
<html lang="es-MX" >
<head>
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
String user="melissa";
String password="usermelissapass";
%>
<% Class.forName("org.postgresql.Driver");
con = DriverManager.getConnection(dburl,user,password);
stmt = con.createStatement();
String Nid_cliente;
String Nombre ="";
String Ncolonia ="";
String Ncp ="";
String Nresponsable ="";
String Actualiza = "";
%>

<%
    Pattern p1=Pattern.compile("^[0-9.]+$");
    Pattern p2=Pattern.compile("^[A-Za-z]+$");

%>


<%
    int cont=0;

    /* recuperando datos del formulario */
    request.setCharacterEncoding("UTF-8");

    Nid_cliente=request.getParameter("id_cliente");
    Matcher matcher=p1.matcher(Nid_cliente);
        if(matcher.find()==true){
          cont++;
        }else{

        }

    Nombre=request.getParameter("nombre");
    Matcher matcher1=p2.matcher(Nombre);
        if(matcher1.find()==true){
          cont++;
        }else{

        }

    Ncolonia=request.getParameter("colonia");
    Matcher matcher2=p2.matcher(Ncolonia);
        if(matcher2.find()==true){
          cont++;
        }else{

        }

    Ncp =request.getParameter("cp");
    Matcher matcher3=p1.matcher(Ncp);
        if(matcher3.find()==true){
          cont++;
        }else{

        }

    Nresponsable=request.getParameter("responsable");
    Matcher matcher4=p2.matcher(Nresponsable);
        if(matcher4.find()==true){
          cont++;
        }else{
        }

%>

<%
  if(cont==5){
    //Generando la actualización con el nombre dado en el formulario
    Actualiza = "update cliente set nombre =?,colonia=?,cp=?,responsable=? where id_cliente="+Nid_cliente+"";
    PreparedStatement pstm=con.prepareStatement(Actualiza);
    pstm.setString(1,Nombre);
    pstm.setString(2,Ncolonia);
    pstm.setString(3,Ncp);
    pstm.setString(4,Nresponsable);
    //generando actualización en la Base de datos
    pstm.executeUpdate();
    pstm.close(); //Cerrando conexión con el servidor de Base de Datos
  }else{
      out.println("<script>alert('Datos inválidos')</script>");
      out.print(cont);
  }

  con.close();

%>

<br><br><br><br><br><br><br><br><br><br><br>
  <h2 align="center"><br>Cliente actualizado exitosamente</h2>

</body>
</html>
