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
import model.Category;
import model.Product;
import model.User;
import service.ProductService;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;
import service.CategoryService;

@WebServlet(name = "HomeSerlvet", urlPatterns = {"/home"})
public class HomeSerlvet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ProductService productService;
    private CategoryService categoryService;

    @Override
    public void init() {
        productService = new ProductService();
        categoryService = new CategoryService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Lấy danh sách category từ session (nếu có)
        List<Category> categories = (List<Category>) session.getAttribute("categories");
        if (categories == null) {
            categories = categoryService.getAllCategories();
            session.setAttribute("categories", categories);
        }

        // Lấy groupedProducts từ session (nếu có)
        Map<Category, List<Product>> groupedProducts
                = (Map<Category, List<Product>>) session.getAttribute("groupedProducts");
        if (groupedProducts == null) {
            groupedProducts = new LinkedHashMap<>();
            for (Category category : categories) {
                List<Product> products = productService.getProductsByCategoryId(category.getCategoryId());
                groupedProducts.put(category, products);
            }
            session.setAttribute("groupedProducts", groupedProducts);
        }

        // Xử lý lọc theo category nếu có tham số categoryId
        String categoryIdStr = request.getParameter("categoryId");
        List<Product> listProduct;

        if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
            try {
                int categoryId = Integer.parseInt(categoryIdStr);
                listProduct = productService.getProductsByCategoryId(categoryId);
            } catch (NumberFormatException e) {
                listProduct = productService.getAllProducts();
            }
        } else {
            listProduct = productService.getAllProducts();
        }

        // Gửi sản phẩm lọc vào request (chỉ request, không cần lưu session)
        request.setAttribute("products", listProduct);
        request.setAttribute("groupedProducts", groupedProducts); // cho phần hiển thị nhóm

        // Chuyển đến trang home.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    }
}
