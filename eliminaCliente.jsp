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
             String Id_cliente;
             String Elimina = "";
          %>

          <%
              Pattern pattern=Pattern.compile("^[0-9.]+$");
          %>

          <%
              int valido=0;

              /* recuperando datos del formulario */
              request.setCharacterEncoding("UTF-8");

              Id_cliente=request.getParameter("id_cliente");
              Matcher matcher=pattern.matcher(Id_cliente);
                  if(matcher.find()==true){
                    valido++;
                  }else{

                  }


          %>

          <%
            if(valido==1){
              //Generando la actualización con el nombre dado en el formulario
              Elimina = "DELETE FROM cliente where id_cliente="+Id_cliente+"";
              PreparedStatement pstm=con.prepareStatement(Elimina);
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
            <h2 align="center"><br>Cliente eliminado exitosamente</h2>

        </body>
    </html>
