/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import categoryDAO.CategoryDAO;
import categoryDAO.ICategoryDAO;
import java.sql.SQLException;
import java.util.List;
import model.Category;

/**
 *
 * @author Admin
 */
public class CategoryService implements ICategoryService {

    private ICategoryDAO categoryDao;

    public CategoryService() {
        this.categoryDao = new CategoryDAO();
    }

    @Override
    public List<Category> getAllProducts() {
        return categoryDao.selectAllProducts();
    }

    @Override
    public Category getProductById(int id) {
        return categoryDao.selectProduct(id);
    }

    @Override
    public void addProduct(Category cate) throws SQLException {
        categoryDao.insertProduct(cate);
    }

    @Override
    public void removeProduct(int id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean modifyProduct(Category cate) throws SQLException {
        return categoryDao.updateCategory(cate);
    }

}
