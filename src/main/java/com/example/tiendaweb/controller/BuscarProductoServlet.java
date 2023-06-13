package com.example.tiendaweb.controller;

import com.example.tiendaweb.model.Producto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "BuscarProductoServlet",value ="/buscarProducto")
public class BuscarProductoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/buscarProducto.jsp");
        String nombreProducto=request.getParameter("nombre");
        String categoriaProducto=request.getParameter("tipoProducto");
        if(!nombreProducto.isEmpty() || !categoriaProducto.isEmpty()){
            Producto producto=new Producto(0,nombreProducto,categoriaProducto,0);
            ArrayList<Producto>productos=producto.buscarProducto();
            if(productos.size() != 0){
                System.out.println("asdasdsad");
                request.setAttribute("productos",productos);
            }
        }
        requestDispatcher.forward(request,response);
    }
}
