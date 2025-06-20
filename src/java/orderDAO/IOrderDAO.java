package orderDAO;

import java.sql.SQLException;
import java.util.List;
import model.Order;

public interface IOrderDAO {

    public void insertOrder(Order orderObj) throws SQLException;

    public Order getOrderById(int id);

    public List<Order> selectAllOrders();

    public boolean deleteOrder(int id) throws SQLException;

    public boolean updateOrder(Order orderObj) throws SQLException;

    public int createOrder(Order order);

    public void addOrderDetail(int orderId, int productId, int quantity, Double price);
}
