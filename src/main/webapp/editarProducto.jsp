<%--
  Created by IntelliJ IDEA.
  User: newma
  Date: 08-06-2023
  Time: 18:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="styles.css">
    <title>Editar Producto</title>
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
            <section class="e-product-form">
                <h1>Editar producto seleccionado</h1>
                <form action="editarProducto" method="post">
                    <input name="id" type="text" hidden="hidden" value="${id}">
                    <input name="nombre" placeholder="Nombre" type="text" value="${nombre}">
                    <select name="tipoProducto" id="" p >
                        <option value="0">Selecciona la categoria</option>
                        <option value="1">Smartphone</option>
                        <option value="2">Tablet</option>
                        <option value="3">Notebook</option>
                        <option value="4">Cable</option>
                        <option value="5">Periferico</option>

                    </select>
                    <input type="number" name="precio" placeholder="$$$ Precio" value="${precio}">
                    <button type="submit">Editar</button>
                </form>
            </section>
        </article>
    </main>
</body>
</html>
