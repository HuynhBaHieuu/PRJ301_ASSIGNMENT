/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package productDAO;

import dao.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.User;

/**
 *
 * @author Admin
 */
public class ProductDAO implements IProductDAO {

    private static final String SELECT_PRODUCTS = "SELECT * FROM Products Where id like ?";
    private static final String SELECT_CATEGORIES = "SELECT * FROM Products WHERE category_id = ?";
    private static final String INSERT_PRODUCT = "INSERT INTO Products (name, price, description, stock, status, category_id, image_url) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM Products";
    private static final String UPDATE_PRODUCT = "UPDATE Products SET name = ?, price = ?, description = ?, stock = ?, import_date = ?, status = ?, category_id = ?, image_url = ? WHERE id = ?";
    private static final String UPDATE_STATUS = "UPDATE Products SET status = ? WHERE id = ?";
    private static final String SEARCH_PRODUCT = "SELECT * FROM products WHERE name LIKE ? OR description LIKE ?";

    @Override
    public void insertProduct(Product pro) throws SQLException {
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(INSERT_PRODUCT)) {

            ptm.setString(1, pro.getName());
            ptm.setDouble(2, pro.getPrice());
            ptm.setString(3, pro.getDescription());
            ptm.setInt(4, pro.getStock());
//            ptm.setDate(5, pro.getImportDate());
            ptm.setBoolean(5, pro.getStatus());
            ptm.setInt(6, pro.getCategoryId());
            ptm.setString(7,pro.getImageUrl());
            ptm.executeUpdate();
        }
    }

    @Override
    public Product selectProduct(int id) {
        Product p = null;
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(SELECT_PRODUCTS)) {

            ptm.setInt(1, id);
            ResultSet rs = ptm.executeQuery();

            while (rs.next()) {
                p = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("stock"),
                        rs.getDate("import_date"),
                        rs.getBoolean("status"),
                        rs.getInt("category_id"),
                        rs.getString("image_url")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }
    
    public List<Product> getProductsByCategoryId(int categoryId) {
        List<Product> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(SELECT_CATEGORIES)) {

            ptm.setInt(1, categoryId);
            ResultSet rs = ptm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setDescription(rs.getString("description"));
                p.setCategoryId(rs.getInt("category_id"));
                p.setImageUrl(rs.getString("image_url"));
                // thêm ảnh nếu có
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Product> selectAllProducts() {
        List<Product> products = new ArrayList<>();
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(SELECT_ALL_PRODUCTS); ResultSet rs = ptm.executeQuery()) {

            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("stock"),
                        rs.getDate("import_date"),
                        rs.getBoolean("status"),
                        rs.getInt("category_id"),
                        rs.getString("image_url")
                );
                products.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public List<Product> searchProducts(String query) throws SQLException{
        List<Product> filteredProducts = new ArrayList<>();
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(SEARCH_PRODUCT);) {

            ptm.setString(1, "%" + query + "%");
            ptm.setString(2, "%" + query + "%");
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                // Lấy dữ liệu từ kết quả truy vấn và tạo đối tượng Product
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                int stock = rs.getInt("stock");

                // Thêm sản phẩm vào danh sách kết quả
                Product product = new Product(id, name, price, description, stock);
                filteredProducts.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return filteredProducts;
    }

    @Override
    public void deleteProduct(int id, boolean status) throws SQLException {
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(UPDATE_STATUS)) {
            ps.setInt(1, status ? 1 : 0);
            ps.setInt(2, id);
            ps.executeUpdate();
        }
    }

    @Override
    public boolean updateProduct(Product pro) throws SQLException {
        boolean rowUpdated;
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(UPDATE_PRODUCT)) {

            ptm.setString(1, pro.getName());
            ptm.setDouble(2, pro.getPrice());
            ptm.setString(3, pro.getDescription());
            ptm.setInt(4, pro.getStock());
            ptm.setDate(5, pro.getImportDate());
            ptm.setBoolean(6, pro.getStatus());
            ptm.setInt(7, pro.getCategoryId());
            ptm.setString(8, pro.getImageUrl());
            ptm.setInt(9, pro.getId());

            rowUpdated = ptm.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public static void main(String[] args) {
        // Instantiate ProductDAO
        ProductDAO productDAO = new ProductDAO();

        try {
            // Get all products
            List<Product> products = productDAO.selectAllProducts();

            // Check if products list is not empty
            if (products != null && !products.isEmpty()) {
                // Print product details
                for (Product product : products) {
                    System.out.println("Product ID: " + product.getId());
                    System.out.println("Product Name: " + product.getName());
                    System.out.println("Price: " + product.getPrice());
                    System.out.println("Description: " + product.getDescription());
                    System.out.println("Stock: " + product.getStock());
                    System.out.println("Import Date: " + product.getImportDate());
                    System.out.println("Status: " + (product.getStatus() ? "Active" : "Inactive"));
                    System.out.println("Category ID: " + product.getCategoryId());
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
