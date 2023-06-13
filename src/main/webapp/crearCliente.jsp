<%--
  Created by IntelliJ IDEA.
  User: newma
  Date: 08-06-2023
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="styles.css">

    <title>Registrar Cliente</title>
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
        <section class="register-form">
            <h1>Registrar Cliente</h1>
            <form action="registroCliente" method="post">
                <input placeholder="Rut" name="rut" type="text">
                <input placeholder="Nombre" name="nombre" type="text">
                <button type="submit">Registrar cliente</button>
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
