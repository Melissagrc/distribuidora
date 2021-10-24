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
    String user="melissa";
    String password="usermelissapass";
%>
<% Class.forName("org.postgresql.Driver");
    con = DriverManager.getConnection(dburl,user,password);
    stmt = con.createStatement();
    String ID_cliente;
    String ID_distribuidora;
    String Nombre ="";
    String Colonia ="";
    String Cp;
    String Responsable="";
    String AgregaDatos = "";
%>

<%
    Pattern pattern1=Pattern.compile("^[0-9.]+$");
    Pattern pattern2=Pattern.compile("^[a-zA-Z]+$");
%>

<%
    int valido=0;

    /* recuperando datos del formulario */
    request.setCharacterEncoding("UTF-8");

    ID_cliente=request.getParameter("id_cliente");
    Matcher m1=pattern1.matcher(ID_cliente);
        if(m1.find()==true){
          valido++;
        }else{}

    ID_distribuidora=request.getParameter("id_distribuidora");
    Matcher m2=pattern1.matcher(ID_distribuidora);
        if(m2.find()==true){
          valido++;
        }else{}

    Colonia=request.getParameter("colonia");
    Matcher m3=pattern2.matcher(Colonia);
        if(m3.find()==true){
          valido++;
        }else{}

    Nombre=request.getParameter("nombre");
    Matcher m4=pattern2.matcher(Nombre);
        if(m4.find()==true){
          valido++;
        }else{}

    Cp=request.getParameter("cp");
    Matcher m5=pattern1.matcher(Cp);
        if(m5.find()==true){
          valido++;
        }else{}

    Responsable=request.getParameter("responsable");
    Matcher m6=pattern2.matcher(Responsable);
        if(m6.find()==true){
          valido++;
        }else{}


%>

<%
  if(valido==6){
    int add_cliente=Integer.parseInt(ID_cliente);
    int add_distribuidora=Integer.parseInt(ID_distribuidora);
    int add_cp=Integer.parseInt(Cp);


    //Generando la actualización con el nombre dado en el formulario
    AgregaDatos= "INSERT INTO cliente(id_cliente,id_distribuidora,nombre,colonia,cp,responsable) VALUES(?,?,?,?,?,?)";
    PreparedStatement pstm=con.prepareStatement(AgregaDatos);
    pstm.setInt(1,add_cliente);
    pstm.setInt(2,add_distribuidora);
    pstm.setString(3,Nombre);
    pstm.setString(4,Colonia);
    pstm.setInt(5,add_cp);
    pstm.setString(6,Responsable);
    //mandando mensaje si la informacion fue exitosa
    //generando actualización en la Base de datos
    pstm.executeUpdate();
    pstm.close(); //Cerrando conexión con el servidor de Base de Datos
  }else{
      out.println("<script>alert('Datos inválidos')</script>");
  }

  con.close();

%>

<br><br><br><br><br><br><br><br><br><br><br>
  <h2 align="center"><br>Cliente insertado exitosamente</h2>


</body>
</html>
