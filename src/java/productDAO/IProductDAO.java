/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package productDAO;

import java.util.List;
import model.Product;
import java.sql.SQLException;

public interface IProductDAO {

    public void insertProduct(Product pro) throws SQLException;

    public Product selectProduct(int id);

    public List<Product> selectAllProducts();

    public void deleteProduct(int id, boolean status) throws SQLException;

    public boolean updateProduct(Product pro) throws SQLException;
}
