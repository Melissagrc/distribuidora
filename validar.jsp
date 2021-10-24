<%@ page session="true"%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.regex.*"%>

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
       //stmt = con.prepareStatement(validacion); //creamos el prepareStatement
       String datoId="";
       String datoCorreo= ""; //creando variables de tipo string para datos del formulario
       String datoPassword = "";
       String datoNivel="";
       String validacion = ""; //variable para guardar la consulta
       boolean aceptar;
    %>

    <%
      Pattern pattern1=Pattern.compile("[\\w\\.]+@\\w+\\.\\w+");
      Pattern pattern2=Pattern.compile("^[A-Za-z0-9]+$");
    %>

    <%
      int valido=0;
      /* recuperando datos del formulario */
      request.setCharacterEncoding("UTF-8");

      datoCorreo=request.getParameter("correo");
      Matcher matcher1=pattern1.matcher(datoCorreo);
        if(matcher1.find()){
          valido++;

        }else{
        }

      datoPassword=request.getParameter("contraseña");
      Matcher matcher2=pattern2.matcher(datoPassword);
        if(matcher2.find()){
          valido++;
          
        }else{
        }


    %>


    <%

      if(valido==2){
            //consulta SQL
            validacion = ("SELECT COUNT(correo) FROM usuarios where correo = ? AND password=md5(?)");
            PreparedStatement pstm=con.prepareStatement(validacion); //creamos el prepareStatement
            pstm.setString(1,datoCorreo);
            pstm.setString(2,datoPassword);
            rs=pstm.executeQuery();



    %>
    <%
            while(rs.next()){
                  //si COUNT nos regresa uno se guardará en la variable num
                  int num = rs.getInt(1);


                  if(num==1){
                    //creamos la sesion para el usuarios
                    session.setAttribute("correo",datoCorreo);
                    //redirijimos hacia la pagina
                    response.sendRedirect("index.jsp");
                  }else{
                    //si no existe el usuario se envia de nuevo al formulario
                    response.sendRedirect("login.jsp");
                  }
              }//fin del while
        }else{
          out.println("<script>alert('Usuario o contraseña inválidos')</script>");
        }
      //cerraramos la conexión
      con.close();
    %>


    </body>
  </html>
