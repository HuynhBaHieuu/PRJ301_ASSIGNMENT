/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package service;

import java.util.List;
import model.Product;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public interface IProductService {

    void addProduct(Product pro) throws SQLException;

    Product getProductById(int id);
    
    List<Product> getProductsByCategoryId(int categoryId);
    
    List<Product> getAllProducts();

    List<Product> searchProducts(String query) throws SQLException;

    void removeProduct(int id, boolean status) throws SQLException;

    boolean modifyProduct(Product pro) throws SQLException;
}
