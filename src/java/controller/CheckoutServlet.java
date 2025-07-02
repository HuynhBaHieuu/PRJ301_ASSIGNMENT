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

        // Kiểm tra giỏ hàng
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

        // Kiểm tra tồn kho trước khi cho phép đặt hàng
        boolean isValid = true;
        while (isValid) {
            for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
                Product product = productService.getProductById(entry.getKey());
                CartItem item = entry.getValue();

                // Kiểm tra nếu số lượng đặt vượt quá tồn kho
                if (item.getQuantity() > product.getStock()) {
                    // Thông báo lỗi về số lượng không đủ
//                    request.setAttribute("errorMessage", "Sản phẩm '" + product.getName() + "' không đủ hàng trong kho.");
//                    request.getRequestDispatcher("cart/cart2.jsp").forward(request, response);
                    session.setAttribute("errorMessage", "Sản phẩm '" + product.getName() + "' không đủ hàng trong kho.");
                    response.sendRedirect(request.getContextPath() + "/cart/cart2.jsp");
                    return;  // Dừng quá trình đặt hàng và yêu cầu nhập lại
                }
            }
            isValid = false;  // Nếu không có sản phẩm nào vượt quá số lượng tồn kho, thoát khỏi vòng lặp
        }

        // Tạo đơn hàng mới
        Order order = new Order(userId, totalPrice, "0");

        try {
            orderService.addOrder(order);  // Thêm đơn hàng vào bảng Orders

            // Thêm chi tiết đơn hàng và trừ tồn kho
            for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
                int productId = entry.getKey();
                CartItem item = entry.getValue();
                Product product = productService.getProductById(productId);

                // Thêm chi tiết đơn hàng
                orderService.addOrderDetail(order.getId(), productId, item.getQuantity(), product.getPrice());

                // Cập nhật tồn kho
                int newQuantity = product.getStock() - item.getQuantity();
                productService.updateStock(productId, newQuantity);  // Cập nhật kho
            }

        } catch (SQLException ex) {
            Logger.getLogger(CheckoutServlet.class.getName()).log(Level.SEVERE, null, ex);
            // Nếu có lỗi, gửi người dùng quay lại giỏ hàng với thông báo lỗi
            request.setAttribute("errorMessage", "Đã xảy ra lỗi khi xử lý đơn hàng. Vui lòng thử lại.");
            request.getRequestDispatcher("cart/cart2.jsp").forward(request, response);
            return;
        }

        // Xóa giỏ hàng sau khi đặt hàng thành công
        session.removeAttribute("cart");

        // Chuyển hướng người dùng đến trang thành công
        response.sendRedirect("cart/success.jsp");
    }
}
