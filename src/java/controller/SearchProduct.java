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
import java.util.List;
import model.Product;
import service.ProductService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SearchProduct", urlPatterns = {"/search"})
public class SearchProduct extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ProductService productService;

    public void init() {
        productService = new ProductService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");

        if (query == null || query.trim().isEmpty()) {
            response.sendRedirect("home.jsp");
            return;
        }
        try {
            // Lọc các sản phẩm theo từ khóa từ ProductService
            List<Product> products = productService.searchProducts(query);

            // Gửi kết quả tìm kiếm đến trang JSP
            request.setAttribute("products", products);
            request.setAttribute("searchQuery", query);
            RequestDispatcher dispatcher = request.getRequestDispatcher("searchResult.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            // Xử lý lỗi nếu có sự cố trong quá trình tìm kiếm
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving products");
        }
    }
}
