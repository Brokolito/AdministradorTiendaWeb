package com.example.tiendaweb.model;

import com.example.tiendaweb.model.data.DBConnector;
import com.example.tiendaweb.model.data.dao.ProductoDAO;
import org.jooq.DSLContext;
import org.jooq.impl.DSL;

import java.sql.Connection;
import java.util.ArrayList;

public class Producto {
    private int idProducto;
    private String nombreProducto;
    private String categoriaProducto;
    private int precio;

    public Producto(int idProducto,String nombreProducto, String categoriaProducto,int precio) {
        this.idProducto=idProducto;
        this.nombreProducto = nombreProducto;
        this.categoriaProducto = categoriaProducto;
        this.precio=precio;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getCategoriaProducto() {
        return categoriaProducto;
    }

    public void setCategoriaProducto(String categoriaProducto) {
        this.categoriaProducto = categoriaProducto;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public boolean registrarProducto(){
        Connection connection= DBConnector.connection("tienda","root","");
        DSLContext query= DSL.using(connection);
        System.out.println("a");
        return new ProductoDAO().registrarProducto(query,this);
    }
    public ArrayList<Producto> buscarProducto(){
        Connection connection= DBConnector.connection("tienda","root","");
        DSLContext query= DSL.using(connection);
        System.out.println("a");
        return new ProductoDAO().buscarProducto(query,this);
    }
    public boolean modificarProducto(){
        Connection connection= DBConnector.connection("tienda","root","");
        DSLContext query= DSL.using(connection);
        System.out.println("a");
        return new ProductoDAO().modificarProducto(query,this);
    }
}
