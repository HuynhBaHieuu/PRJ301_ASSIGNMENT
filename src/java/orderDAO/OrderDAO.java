package orderDAO;

import dao.DBConnection;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Order;

/**
 *
 * @author Admin
 */
public class OrderDAO implements IOrderDAO {

    private static final String SELECT_ORDER_BY_ID = "SELECT * FROM Orders WHERE id = ?";
    private static final String INSERT_ORDER = "INSERT INTO Orders (user_id, total_price, status) VALUES (?, ?, ?)";
    private static final String INSERT_ORDER_DETAIL = "INSERT INTO OrderDetails (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
    private static final String SELECT_ALL_ORDERS = "SELECT * from Orders";
    private static final String UPDATE_STATUS = "UPDATE Orders SET status = ? WHERE id = ?";
    private static final String UPDATE_ORDER = "UPDATE Orders SET user_id = ?, total_price = ?, status = ? WHERE id = ?";

    @Override
    public Order getOrderById(int id) {
        Order order = null;
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(SELECT_ORDER_BY_ID)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                order = Order.fromResultSet(rs);
            } else {
                System.out.println("User not found!");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return order;
    }

    @Override
    public void insertOrder(Order orderObj) throws SQLException {
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(INSERT_ORDER)) {

            ptm.setInt(1, orderObj.getUserId());
            ptm.setDouble(2, orderObj.getTotalPrice());
            ptm.setString(3, orderObj.getStatus());
            ptm.executeUpdate();
        }
    }

    @Override
    public List<Order> selectAllOrders() {
        List<Order> orders = new ArrayList<>();
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(SELECT_ALL_ORDERS); ResultSet rs = ptm.executeQuery()) {

            while (rs.next()) {
                Order o = new Order(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getDate("order_date"),
                        rs.getDouble("total_price"),
                        rs.getString("status")
                );
                orders.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    @Override
    public boolean deleteOrder(int id) throws SQLException {
        boolean rowUpdated = false;
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(UPDATE_STATUS)) {
            ps.setInt(1, 1); // 1 = Paid
            ps.setInt(2, id);
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public boolean updateOrder(Order orderObj) throws SQLException {
        boolean rowUpdated;
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(UPDATE_ORDER)) {

            ptm.setInt(1, orderObj.getUserId());
            ptm.setDouble(2, orderObj.getTotalPrice());
            ptm.setInt(3, Integer.parseInt(orderObj.getStatus()));
            ptm.setInt(4, orderObj.getId());

            rowUpdated = ptm.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public int createOrder(Order order) {
        int orderId = -1;
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(INSERT_ORDER, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ptm.setInt(1, order.getUserId());
            ptm.setDouble(2, order.getTotalPrice());
            ptm.setInt(3, Integer.parseInt(order.getStatus()));
            ptm.executeUpdate();

            ResultSet rs = ptm.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1); // lấy id tự tăng vừa tạo
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderId;
    }

    @Override
    public void addOrderDetail(int orderId, int productId, int quantity, Double price) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO OrderDetails (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, orderId);
            stm.setInt(2, productId);
            stm.setInt(3, quantity);
            stm.setDouble(4, price);
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
