<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=uft-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
   <html lang="es-MX">
     <head>
        <link type="text/css" href="estilo.css" rel="stylesheet">
        <title>JPS con acceso a base de datos</title>
        <meta charset="UTF-8">
     </head>
   <body>

     <!--AQUI COMIENZA EL HEADER-->
         <header class="header">
             <div class="contenido1">
               <div class="logo">
                 <h1>Sutibotana</h1>
               </div>

               <nav class="menu">
                 <ul>
                 <li><a href="index.jsp">Inicio</a></li>
                 <li><a href="">Añadir</a>
                   <ul class="submenu">
                     <li><a href="cambioingresaCliente.jsp">Cliente</a></li>
                     <li><a href="cambiadatoInsertProducto.jsp">Producto</a></li>
                   </ul>
                 </li>
                 <li><a href="">Actualizar</a>
                   <ul class="submenu">
                     <li><a href="clienteActualiza.jsp">Cliente</a></li>
                     <li><a href="productoActualiza.jsp">Producto</a></li>
                   </ul>
                 </li>
                 <li><a href="">Consultar</a>
                   <ul class="submenu">
                     <li><a href="accesobdSurtibotana.jsp">Cliente</a></li>
                     <li><a href="accesobdProductos.jsp">Producto</a></li>
                   </ul>
                 </li>
                 <li><a href="">Eliminar</a>
                   <ul class="submenu">
                     <li><a href="clienteElimina.jsp">Cliente</a></li>
                     <li><a href="productoElimina.jsp">Producto</a></li>
                   </ul>
                 </li>
                 <li><a href="cerrarSesion.jsp">Cerrar Sesión</a></li>
               </ul>
             </nav>

             </div>
         </header>
     <!--AQUI TERMINA EL HEADER-->

     <br><br><br><br><br><br>

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
               String query="";
            %>
        <span><h2 align="center">Productos</h2><span>
              <%
                query="select* from producto";
                rs=stmt.executeQuery(query);
              %>
        <!--comentario html-->

      <div class="info">
        <table>
              <tr>
              <th>Id_producto</th>
              <th>Categoria</th>
              <th>Marca</th>
		          <th>Sabor</th>
		          <th>Tamaño</th>
              </tr>
             <tbody>
               <%
                  while(rs.next()){
                  String Rid_producto = rs.getString("id_producto");
                  String Rcategoria = rs.getString("categoria");
		              String Rmarca = rs.getString("marca");
		              String Rsabor = rs.getString("sabor");
		              String Rtamaño = rs.getString("tamanio");

               %>
	             <tr>
                 <td><%=Rid_producto%></td>
                 <td><%=Rcategoria%></td>
                 <td><%=Rmarca%></td>
                 <td><%= Rsabor %></td>
                 <td><%= Rtamaño %></td>
               </tr>
                <%
                  }
                %>
            <tbody>

        </table>
      </div>



  </body>
</html>
