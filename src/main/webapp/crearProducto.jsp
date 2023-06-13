<%--
  Created by IntelliJ IDEA.
  User: newma
  Date: 08-06-2023
  Time: 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="styles.css">

    <title>Crear producto</title>
</head>
<body>
    <main>
        <nav class="n-bar">
            <ul>
                <li><strong><a href="index.jsp">Tienda Web</a></strong></li>
            </ul>
            <ul>
                <li><a href="crearProducto.jsp">Crear Producto</a></li>
                <li><a href="crearCliente.jsp">Agregar Cliente</a></li>
                <li><a href="buscarProducto.jsp" role="button">Busqueda de articulo</a></li>
            </ul>
        </nav>
        <article>
            <section class="product-form">
                <form action="registroProducto" method="post">
                    <h1>Registrar producto</h1>
                    <input placeholder="Nombre del producto" name="nombre" type="text" required>
                    <select name="tipoProducto" id="">
                        <option value="0">Selecciona la categoria</option>
                        <option value="1">Smartphone</option>
                        <option value="2">Tablet</option>
                        <option value="3">Notebook</option>
                        <option value="4">Cable</option>
                        <option value="5">Periferico</option>

                    </select>
                    <input type="number" name="precio" placeholder="$$$ Precio">
                    <button type="submit">Registrar Producto</button>
                </form>
                <%
                    String mensaje = (String) request.getAttribute("status");
                    if (mensaje != null && !mensaje.isEmpty()) {
                %>
                <h2><%= mensaje %></h2>
                <%
                    }
                %>
            </section>
        </article>
    </main>
</body>
</html>
