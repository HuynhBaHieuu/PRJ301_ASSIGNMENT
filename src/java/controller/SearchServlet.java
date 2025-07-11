package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import productDAO.ProductDAO;

@WebServlet("/searchAI") // Sửa thành /searchAI để phân biệt với search thủ công
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String query = request.getParameter("query");
        String category = request.getParameter("category");

        ProductDAO productDAO = new ProductDAO();
        List<Product> products = new ArrayList<>();

        try {
            if (category != null && !category.isEmpty()) {
                System.out.println("Searching by AI category: " + category);
                products = productDAO.getProductsByCategoryName(category);
                request.setAttribute("category", category);
            } else if (query != null && !query.isEmpty()) {
                System.out.println("Searching by query: " + query);
                products = productDAO.searchProducts(query);
                request.setAttribute("searchQuery", query);
            } else {
                products = new ArrayList<>();
                System.out.println("No search parameters provided");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi hệ thống khi tìm kiếm sản phẩm: " + e.getMessage());
        }

        System.out.println("Found " + products.size() + " products");
        request.setAttribute("products", products);
        request.getRequestDispatcher("/searchResult.jsp").forward(request, response);
    }
}
