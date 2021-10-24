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
String user="postgres";
String password=" ";
%>
<% Class.forName("org.postgresql.Driver");
con = DriverManager.getConnection(dburl,user,password);
stmt = con.createStatement();
String query ="";
String DatoFormu =""; //creando variable string para dato del formulario
%>

<span> Capturando información del formulario</span>
<br> <br> <br>
<%
/* recuperando datos del formulario */
request.setCharacterEncoding("UTF-8"); //recuperar en UTF-8
//capturando en variable java el valor de la caja bsca
DatoFormu =' request.getParameter("bsca");'
//Generando la consulta el nombre dado en el formulario
// El + ayuda a obtener el valor de la variable java
// el juego de comilla doble y comilla simple puede jugarnos malas
