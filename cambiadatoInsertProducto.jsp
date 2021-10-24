<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="es-MX" >
<head>
<link type="text/css" href="estilo.css" rel="stylesheet">
<title>Insertar Productos</title>
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

  <br><br><br><br><br><br><br><br>


<form action="insertaProducto.jsp" method="get">
<h2 align="center">Insertar Producto</h2>
<span>ID producto</span>
<br>
<input type"text" name="id_producto" pattern="[0-9]{1,10}" value="" placeholder="Ejemplo:1234" autocomplete="off" autofocus required>
<br>
<span> ID marca</span>
<br>
<input type="text" name="marca" pattern="[0-9]{1,10}" value="" placeholder="Ejemplo:1234" autocomplete="off" autofocus required>
<br>
<span> Categoria</span>
<br>
<input type="text" name="categoria" pattern="[0-9]{1.4}" value="" placeholder="Ejemplo:1" autocomplete="off" autofocus required>
<br>
<span> Sabor</span>
<br>
<input type="text" name="sabor" pattern="[A-Za-z]{1,25}" value="" placeholder="Ejemplo:Naranja" autocomplete="off" autofocus required>
<br>
<span> Tamaño</span>
<br>
<input type="text" name="tamanio" pattern="[A-Za-z0-9]{1,10}" value="" placeholder="Ejemplo:200ml" autocomplete="off" autofocus required>
<br>
<center>
<button type="submit" class="button">Agregar</button>
<br>
</center>
</form>


</body>
</html>
