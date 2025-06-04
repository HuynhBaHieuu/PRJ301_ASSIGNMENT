/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package service;

import model.Category;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface ICategoryService {

    List<Category> getAllProducts();

    Category getProductById(int id);

    void addProduct(Category pro) throws SQLException;

    void removeProduct(int id) throws SQLException;

    boolean modifyProduct(Category pro) throws SQLException;
}
