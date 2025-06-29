/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
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
 * @author phung
 */
@WebServlet(name = "AllProductsServlet", urlPatterns = {"/sp"})
public class AllProductsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ProductService productService;

    @Override
    public void init() {
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy tất cả sản phẩm từ cơ sở dữ liệu
            List<Product> products = productService.getAllProducts();
            
            // Truyền sản phẩm vào request
            request.setAttribute("products", products);
            
            // Chuyển đến trang allProducts.jsp để hiển thị sản phẩm
            RequestDispatcher dispatcher = request.getRequestDispatcher("productItem/allProducts.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error retrieving product data", e);
        }   
    }
}