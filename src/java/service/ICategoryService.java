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

    List<Category> getAllCategories();

    Category getCategoryById(int id);

    void addCategory(Category pro) throws SQLException;

    void removeCategory(int id) throws SQLException;

    boolean modifyCategory(Category pro) throws SQLException;
}
