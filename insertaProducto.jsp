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
String user="jesus";
String password="usercdjesuspassword";
%>
<% Class.forName("org.postgresql.Driver");
con = DriverManager.getConnection(dburl,user,password);
stmt = con.createStatement();
String ID_producto="";
String ID_marca="";
String Categoria="";
String Sabor ="";
String Tamanio ="";
String AgregaDatos = "";
%>

<%
    Pattern pattern1=Pattern.compile("^[0-9.]+$");
    Pattern pattern2=Pattern.compile("^[A-Za-z]+$");
    Pattern pattern3=Pattern.compile("^[A-Za-z0-9]+$");
%>

<%
    int valido=0;

    /* recuperando datos del formulario */
    request.setCharacterEncoding("UTF-8");

   ID_producto=request.getParameter("id_producto");
    Matcher matcher=pattern1.matcher(ID_producto);
        if(matcher.find()==true){
          valido++;
        }else{

        }

    Categoria=request.getParameter("categoria");
    Matcher matcher1=pattern1.matcher(Categoria);
        if(matcher1.find()==true){
          valido++;
        }else{

        }

    ID_marca=request.getParameter("marca");
    Matcher matcher2=pattern1.matcher(ID_marca);
        if(matcher2.find()==true){
          valido++;
        }else{

        }

    Sabor=request.getParameter("sabor");
    Matcher matcher3=pattern2.matcher(Sabor);
        if(matcher3.find()==true){
          valido++;
        }else{
        }

    Tamanio=request.getParameter("tamanio");
    Matcher matcher4=pattern3.matcher(Tamanio);
        if(matcher4.find()==true){
          valido++;
        }else{
        }

%>


<%
  if(valido==5){

    int add_marca= Integer.parseInt(ID_marca);
    int add_categoria=Integer.parseInt(Categoria);
    int add_producto=Integer.parseInt(ID_producto);

    //Generando la actualización con el nombre dado en el formulario
    AgregaDatos="INSERT INTO producto(id_producto,categoria,marca,sabor,tamanio) VALUES(?,?,?,?,?)";
    PreparedStatement pstm=con.prepareStatement(AgregaDatos);
    pstm.setInt(1,add_producto);
    pstm.setInt(2,add_categoria);
    pstm.setInt(3,add_marca);
    pstm.setString(4,Sabor);
    pstm.setString(5,Tamanio);
    //generando actualización en la Base de datos
    pstm.executeUpdate();
    pstm.close(); //Cerrando conexión con el servidor de Base de Datos
  }else{
      out.println("<script>alert('Datos inválidos')</script>");
      //out.print(valido);
  }

  con.close();

%>



<%=AgregaDatos %>

<br><br><br><br><br><br><br><br><br><br><br>
<h2 align="center">El producto se ha agregado exitosamente</h2>


</body>
</html>
