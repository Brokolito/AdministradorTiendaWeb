package com.example.tiendaweb.controller;

import com.example.tiendaweb.model.Producto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "RegistroProductoServlet",value = "/registroProducto")
public class RegistroProductoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombreProducto=request.getParameter("nombre");
        String categoria=request.getParameter("tipoProducto");
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/crearProducto.jsp");

        int precio= Integer.parseInt(
                !request.getParameter("precio").isEmpty()?request.getParameter("precio"):"0"
        );
        if(!nombreProducto.isEmpty() && !categoria.isEmpty() && precio!=0){
            Producto producto=new Producto(0,nombreProducto,categoria,precio);
            if(producto.registrarProducto()){
                request.setAttribute("status","Completado el registro");
            }else{
                request.setAttribute("status","Ha ocurrido un error");
            }

        }else {
            request.setAttribute("status","Rellene todos los campos");
        }
        requestDispatcher.forward(request,response);

    }
}
