/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Product;
import model.User;
import service.ProductService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "HomeSerlvet", urlPatterns = {"/home"})
public class HomeSerlvet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ProductService productService;

    @Override
    public void init() {
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Kiểm tra session và role của người dùng
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Lấy danh sách sản phẩm từ cơ sở dữ liệu
        List<Product> listProduct = productService.getAllProducts();
        request.setAttribute("products", listProduct); // Truyền sản phẩm vào request
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
//        if (user == null) {
//            // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang home.jsp
//            RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
//            dispatcher.forward(request, response);
//        } 
//        else {
//            String role = user.getRole();
//            if ("admin".equals(role)) {
//                // Nếu là admin, hiển thị danh sách sản phẩm
//                RequestDispatcher dispatcher = request.getRequestDispatcher("product/productList.jsp");
//                dispatcher.forward(request, response);
//            } else if ("user".equals(role)) {
//                // Nếu là user, chuyển hướng đến trang home.jsp
//                RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
//                dispatcher.forward(request, response);
//            }
//        }

    }
    

}
