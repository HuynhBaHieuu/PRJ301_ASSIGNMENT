/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.mail.MessagingException;
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
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import model.Cart;
import model.Order;
import model.User;
import service.IOrderService;
import service.IProductService;
import service.OrderService;
import service.ProductService;
import utils.EmailUtil;

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
            //Gợi ý sản phẩm

            Set<Integer> suggestedCategoryIds = new HashSet<>();

            Set<Integer> seenProductIds = new HashSet<>();

            for (CartItem item : cart.getItems().values()) {

                suggestedCategoryIds.add(item.getProduct().getCategoryId());

                seenProductIds.add(item.getProduct().getId());

            }

            List<Product> suggested = new ArrayList<>();

            if (productService instanceof ProductService) {

                ProductService concreteService = (ProductService) productService;

                for (int categoryId : suggestedCategoryIds) {

                    List<Product> candidates = concreteService.getSuggestedProductsByCategory(categoryId, seenProductIds, 10);

                    for (Product p : candidates) {

                        if (!suggested.contains(p)) {

                            suggested.add(p);

                            if (suggested.size() >= 5) {

                                break;

                            }

                        }

                    }

                    if (suggested.size() >= 5) {

                        break;

                    }

                }

            }

            //Gửi email xác nhận
            String userEmail = user.getEmail(); // lấy email của user để gửi xác nhận

            String subject = "Xác nhận đơn hàng #" + order.getId();

            // Tạo nội dung chi tiết đơn hàng
            StringBuilder message = new StringBuilder();

            message.append("<h3>Cửa hàng Nông Sản Tương Lai xin chân thành cảm ơn quý khách đã đặt hàng!</h3>");
            message.append("Mã đơn hàng: <b>#" + order.getId() + "</b><br>");

            message.append("Chi tiết đơn hàng:<br><br>");

            for (CartItem item : cart.getItems().values()) {

                Product p = item.getProduct();

                message.append("<b>- " + p.getName() + " | SL: " + item.getQuantity() + " | Giá: " + p.getPrice() + " VNĐ</b><br>");

            }

            message.append("<br><h3>👉 Tổng tiền: " + totalPrice + " VNĐ</h3>");

            message.append("Đội ngũ chúng tôi sẽ xử lý đơn hàng của bạn sớm nhất.<br>");

            message.append("Nếu có vấn đề gì thắc mắc, quý khách có thể liên hệ qua SĐT: <b style=\"color:red;\">0829 495 069</b><br><br>");

            message.append("<h3>🛍️ Gợi ý dành riêng cho bạn</h3>");

            message.append("<table>");

            for (Product s : suggested) {

                message.append("<tr>");

//                message.append("<td style='padding: 10px;'>");
//                String imageBaseUrl = "http://localhost:8080/BoTuoi/image/";
//                message.append("<img src='" + imageBaseUrl + s.getImageUrl() + "' width='100' height='100' style='object-fit: cover; border-radius: 8px;'/>");
//                message.append("</td>");
                message.append("<td style='padding: 10px;'>");

                message.append("<b>" + s.getName() + "</b><br>");

                message.append("Giá: " + s.getPrice() + " VNĐ<br>");

                message.append("<a href=\"http://localhost:8080/BoTuoi/product/productDetail.jsp?id=" + s.getId() + "\">Xem chi tiết</a>");

                message.append("</td>");

                message.append("</tr>");

            }

            message.append("</table><br><br>");

            message.append("Truy cập <a href=\"http://localhost:8080/BoTuoi/login.jsp \">website của chúng tôi</a> để xem thêm các sản phẩm khác.");

            // Gửi email
            try {

                EmailUtil.sendEmail(userEmail, subject, message.toString());

            } catch (MessagingException e) {

                e.printStackTrace(); // Hoặc log lỗi

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
