<%--
  Created by IntelliJ IDEA.
  User: newma
  Date: 08-06-2023
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.tiendaweb.model.Producto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link rel="stylesheet" href="styles.css">

    <title>Buscar Producto</title>
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
        <%
            String mensaje = (String) request.getAttribute("status");
            if (mensaje != null && !mensaje.isEmpty()) {
        %>
        <h2><%= mensaje %></h2>
        <%
            }
        %>
        <section class="b-producto">
            <form action="buscarProducto" method="get">
                <input placeholder="" name="nombre" type="text">
                <select name="tipoProducto" id="">
                    <option value="0">Selecciona la categoria</option>
                    <option value="1">Smartphone</option>
                    <option value="2">Tablet</option>
                    <option value="3">Notebook</option>
                    <option value="4">Cable</option>
                    <option value="5">Periferico</option>
                </select>
                <button type="submit">Buscar producto</button>

            </form>
        </section>
        <section class="r-busqueda">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Nombre producto</th>
                    <th>Categoria</th>
                    <th>Precio</th>
                    <th>Editar</th>
                </tr>
                <c:forEach items="${productos}" var="producto">
                    <tr>
                        <td><c:out value="${producto.getIdProducto()}"></c:out></td>
                        <td><c:out value="${producto.getNombreProducto()}"></c:out> </td>
                        <td> <c:choose>
                                <c:when test="${producto.getCategoriaProducto() eq '1'}">Smartphone</c:when>
                                <c:when test="${producto.getCategoriaProducto() eq '2'}">Tablet</c:when>
                                <c:when test="${producto.getCategoriaProducto() eq '3'}">Notebook</c:when>
                                <c:when test="${producto.getCategoriaProducto() eq '4'}">Cable</c:when>
                                <c:when test="${producto.getCategoriaProducto() eq '5'}">Periférico</c:when>
                                <c:otherwise>Desconocido</c:otherwise>
                            </c:choose>
                        </td>
                        <td> $<c:out value="${producto.getPrecio()}"></c:out> </td>
                        <td>
                            <a href="editarProducto?id=${producto.getIdProducto()}&n=${producto.getNombreProducto()}&c=${producto.getCategoriaProducto()}&p=${producto.getPrecio()}">Editar</a></td>
                    </tr>
                </c:forEach>
            </table>
        </section>
    </article>
</main>
</body>
</html>
