/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package orderDAO;

import dao.DBConnection;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.OrderDetailInfo;


/**
 *
 * @author Administrator
 */
public class CheckOrderDao {
    public List<OrderDetailInfo> getOrderDetailsByPhone(String phone) {
        List<OrderDetailInfo> list = new ArrayList<>();
        String sql = """
                SELECT u.username, p.name AS product_name, od.price, od.quantity, 
                       (od.price * od.quantity) AS total_price,
                       o.status, o.order_date
                FROM Orders o
                JOIN Users u ON o.user_id = u.id
                JOIN OrderDetails od ON o.id = od.order_id
                JOIN Products p ON od.product_id = p.id
                WHERE u.phone = ?
                ORDER BY o.order_date DESC
                """;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetailInfo info = new OrderDetailInfo();
                info.setUsername(rs.getString("username"));
                info.setProductName(rs.getString("product_name"));
                info.setProductPrice(rs.getDouble("price"));
                info.setQuantity(rs.getInt("quantity"));
                info.setTotalPrice(rs.getDouble("total_price"));
                info.setStatus(rs.getString("status"));
                info.setOrderDate(rs.getDate("order_date"));
            list.add(info);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean userExists(String phone) {
        String sql = "SELECT id FROM Users WHERE phone = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            return rs.next(); // Tồn tại
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
