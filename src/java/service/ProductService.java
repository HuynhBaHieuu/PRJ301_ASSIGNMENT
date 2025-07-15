/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import model.Product;
import productDAO.IProductDAO;
import productDAO.ProductDAO;

public class ProductService implements IProductService {

    private IProductDAO productDao;

    public ProductService() {
        this.productDao = new ProductDAO();
    }

    @Override
    public void addProduct(Product pro) throws SQLException {
        productDao.insertProduct(pro);
    }

    @Override
    public Product getProductById(int id) {
        return productDao.selectProduct(id);
    }

    public List<Product> getProductsByCategoryId(int categoryId) {
        return productDao.getProductsByCategoryId(categoryId);
    }

    public List<Product> getSuggestedProductsByCategory(int categoryId, Set<Integer> excludeProductIds, int limit) {
        List<Product> all = getProductsByCategoryId(categoryId);
        List<Product> result = new ArrayList<>();
        for (Product p : all) {

            if ((excludeProductIds == null || !excludeProductIds.contains(p.getId()))) {

                result.add(p);

                if (result.size() >= limit) {
                    break;
                }
            }
        }
        return result;
    }

    @Override
    public List<Product> getAllProducts() {
        return productDao.selectAllProducts();
    }

    @Override
    public List<Product> searchProducts(String query) throws SQLException {
        return productDao.searchProducts(query);
    }

    @Override
    public void removeProduct(int id, boolean status) throws SQLException {
        productDao.deleteProduct(id, status);
    }

    @Override
    public boolean modifyProduct(Product pro) throws SQLException {
        return productDao.updateProduct(pro);
    }

    @Override
    public void updateStock(int productId, int newStock) {
        productDao.updateStock(productId, newStock);
    }
}
