
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page session="true"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 <html lang="es-MX">
  <head>
     <meta charset="UTF-8">
     <title>SURTIBOTANA</title>
     <link rel="stylesheet" type="text/css" href="estilo.css">
  </head>


  <!--AQUI VERIFICAMOS LA SESION INICIADA-->
  <body>
    <%
        //validamos la sesion en la pagina actual
        HttpSession sesion=request.getSession();
        //verificamos los datos para que no accedan sin ingresar sesion
        if(sesion.getAttribute("correo")==null ||sesion.getAttribute("correo").equals("0")){
          response.sendRedirect("login.jsp");
        }
    %>
<!--AQUI COMIENZA EL HEADER-->
    <header class="header">
        <div class="contenido1">
          <div class="logo">
            <h1>Sutibotana</h1>
          </div>

          <nav class="menu">
            <ul>
            <li><a href="">Inicio</a></li>
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
<!--EMPIEZA EL CONTENIDO-->
    <div class="conteint">
     <div class="caja">
      <div class="izquierda">
        <div class="imagen">
          <img class="img" src="/media/productos.jpg" alt="imagen de productos">
            <br>
          <img class="img" src="/media/registro.jpg" alt="imagen de productos">
            <br>
          <img class="img" src="/media/formulario.jpg" alt="imagen de productos">
        </div>
      </div>
      <div class="derecha">
        <article>
          <h4>Productos que ofrece surtibota</h4>
          <br>
          <p>En susutibotana contamos con diversos productos para el surtido de tu tienda
          como por ejemplo refrescos,botanas,
          jugos,aguas,galletas y pastelitos</p>
          <p></p>
        </article>
        <br><br><br><br><br>
        <article>
          <h4>Ingreso de datos</h4><br>
          <p>El sistema cuenta con formularios para realizar cambios tanto en clientes como
          en productos, dando asi la opción para poder agregar,actualizar o eliminar datos a traves del ID númerico</p>
        </article>
        <br><br><br><br><br>
        <article>
          <h4>Consultar datos</h4><br>
          <p>Dentro del sistema puedes consultar los datos de algun cliente o producto a través
          del apartado consultar </p>
        </article>
      </div>
     </div>
   </div>

    </body>
 </html>
