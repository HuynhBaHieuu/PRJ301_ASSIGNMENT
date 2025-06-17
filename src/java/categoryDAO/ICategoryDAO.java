
package categoryDAO;

import java.sql.SQLException;
import java.util.List;
import model.Category;

/**
 *
 * @author Admin
 */
public interface ICategoryDAO {

    public List<Category> selectCategories();
    public Category selectCategory(int id);

    public void insertCategory(Category cate) throws SQLException;

    public void deleteCategory(int id) throws SQLException;

    public boolean updateCategory(Category cate) throws SQLException;
}
