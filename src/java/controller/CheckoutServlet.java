/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Map;
import model.CartItem;
import model.Product;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.sql.SQLException;
import model.Cart;
import model.Order;
import model.User;
import service.IOrderService;
import service.IProductService;
import service.OrderService;
import service.ProductService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckoutServlet", urlPatterns = {"/CheckoutServlet"})
public class CheckoutServlet extends HttpServlet {

    private IOrderService orderService = new OrderService();
    private IProductService productService = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("cart/cart2.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId();
        Double totalPrice = cart.getTotalCost();


        // Tạo Order mới
        Order order = new Order(userId, totalPrice, "Pending");

        try {
            orderService.addOrder(order);  // insert vào bảng Orders
        } catch (SQLException ex) {
            Logger.getLogger(CheckoutServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Lưu chi tiết đơn hàng (OrderDetails)
        for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
            Product product = productService.getProductById(entry.getKey());
            CartItem item = entry.getValue();
            orderService.addOrderDetail(order.getId(), entry.getKey(), item.getQuantity(), product.getPrice());
        }

        session.removeAttribute("cart");
        response.sendRedirect("cart/success.jsp");
    }
}
