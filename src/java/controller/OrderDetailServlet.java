package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;
import model.Product;
import orderDAO.OrderDAO;
import service.OrderService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

@WebServlet(name = "OrderDetailServlet", urlPatterns = {"/OrderDetailServlet"})
public class OrderDetailServlet extends HttpServlet {
    private OrderService orderService = new OrderService();
    private OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null) {
            response.sendRedirect("order.jsp");
            return;
        }
        int orderId = Integer.parseInt(idStr);
        Order order = orderService.getOrderById(orderId);
        List<OrderItemView> orderItems = getOrderItems(orderId);
        request.setAttribute("order", order);
        request.setAttribute("orderItems", orderItems);
        request.getRequestDispatcher("order/orderDetail.jsp").forward(request, response);
    }

    // Helper class for displaying order items
    public static class OrderItemView {
        private String productName;
        private int quantity;
        private double price;
        private double subtotal;

        public String getProductName() {
            return productName;
        }
        public void setProductName(String productName) {
            this.productName = productName;
        }
        public int getQuantity() {
            return quantity;
        }
        public void setQuantity(int quantity) {
            this.quantity = quantity;
        }
        public double getPrice() {
            return price;
        }
        public void setPrice(double price) {
            this.price = price;
        }
        public double getSubtotal() {
            return subtotal;
        }
        public void setSubtotal(double subtotal) {
            this.subtotal = subtotal;
        }
    }

    private List<OrderItemView> getOrderItems(int orderId) {
        List<OrderItemView> items = new ArrayList<>();
        try (Connection conn = dao.DBConnection.getConnection()) {
            String sql = "SELECT od.quantity, od.price, od.subtotal, p.name FROM OrderDetails od JOIN Products p ON od.product_id = p.id WHERE od.order_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderItemView item = new OrderItemView();
                item.setProductName(rs.getString("name"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getDouble("price"));
                item.setSubtotal(rs.getDouble("subtotal"));
                items.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return items;
    }
} 