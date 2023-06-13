package com.example.tiendaweb.model.data.dao;

import com.example.tiendaweb.model.Producto;
import com.example.tiendaweb.model.data.DBConnector;
import org.jooq.DSLContext;
import org.jooq.Result;
import org.jooq.impl.DSL;

import java.util.ArrayList;


public class ProductoDAO {
    public boolean registrarProducto(DSLContext query, Producto producto) {
        String nombreProducto=producto.getNombreProducto();
        String categoriaProducto=producto.getCategoriaProducto();
        int precio=producto.getPrecio();
        int result=query.insertInto(DSL.table("producto"),
                DSL.field("cod_producto"),DSL.field("producto_nombre    "),DSL.field("categoria"),DSL.field("precio"))
                .values(null,nombreProducto,categoriaProducto,precio)
                .execute();
        DBConnector.closeConnection();
        return result==1;
    }

    public ArrayList<Producto> buscarProducto(DSLContext query, Producto producto) {
        String nombreProducto=producto.getNombreProducto();
        String categoriaProducto=producto.getCategoriaProducto();
        Result results = query
                .select()
                .from(DSL.table("producto"))
                .where(DSL.field("producto_nombre").eq(nombreProducto)
                        .or(DSL.field("categoria").eq(categoriaProducto)))
                .fetch();
        ArrayList<Producto> productosEncontrados=new ArrayList<>();
        for (int i = 0; i < results.size(); i++) {
            productosEncontrados.add(new Producto(
                    (Integer) results.getValue(i,"cod_producto"),
                    (String) results.getValue(i,"producto_nombre"),
                    results.getValue(i,"categoria").toString(),
                    (Integer) results.getValue(i,"precio")
            ));
        }
        return productosEncontrados;
    }

    public boolean modificarProducto(DSLContext query, Producto producto) {
        int idProducto= producto.getIdProducto();
        String nombreProducto=producto.getNombreProducto();
        String categoriaProducto=producto.getCategoriaProducto();
        int precio=producto.getPrecio();
        int result=query.update(DSL.table("producto")).
                set(DSL.field("producto_nombre"),nombreProducto).
                set(DSL.field("categoria"),categoriaProducto).
        set(DSL.field("precio"),precio).where(DSL.field("cod_producto").eq(idProducto))
                .execute();
        return result==1;
    }
}
