/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package categoryDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import dao.DBConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author Admin
 */
public class CategoryDAO implements ICategoryDAO {

    private static final String SELECT_ALL_CATEGORIES = "SELECT * FROM Categories";
    private static final String SEARCH_CATEGORIES = "SELECT * FROM Categories Where id like ?";
    private static final String INSERT_CATEGORY = "INSERT INTO Categories (name) VALUES (?)";
    private static final String UPDATE_CATEGORY = "UPDATE Categories SET name = ? WHERE id = ?";

    @Override
    public List<Category> selectCategories() {
        List<Category> categories = new ArrayList<>();
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(SELECT_ALL_CATEGORIES); ResultSet rs = ptm.executeQuery()) {

            while (rs.next()) {
                Category c = new Category(
                        rs.getInt("id"),
                        rs.getString("name")
                );
                categories.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return categories;
    }

    @Override
    public Category selectCategory(int id) {
        Category c = null;
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(SEARCH_CATEGORIES)) {

            ptm.setInt(1, id);
            ResultSet rs = ptm.executeQuery();

            while (rs.next()) {
                c = new Category(
                        rs.getInt("id"),
                        rs.getString("name")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }

    @Override
    public void insertCategory(Category cate) throws SQLException {
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(INSERT_CATEGORY)) {

            ptm.setString(1, cate.getName());
            ptm.executeUpdate();
        }
    }

    @Override
    public void deleteCategory(int id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean updateCategory(Category cate) throws SQLException {
        boolean rowUpdated;
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(UPDATE_CATEGORY)) {

            ptm.setString(1, cate.getName());
            ptm.setInt(8, cate.getCategoryId());

            rowUpdated = ptm.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    public static void main(String[] args) {
        // Instantiate ProductDAO
        CategoryDAO categoryDAO = new CategoryDAO();

        try {
            // Get all products
            List<Category> categories = categoryDAO.selectCategories();

            // Check if products list is not empty
            if (categories != null && !categories.isEmpty()) {
                // Print product details
                for (Category category : categories) {
                    System.out.println("Product ID: " + category.getCategoryId());
                    System.out.println("Product Name: " + category.getName());
                    System.out.println("----------------------------");
                }
            } else {
                System.out.println("No products found.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
