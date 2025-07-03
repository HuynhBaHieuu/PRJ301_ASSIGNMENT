package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import service.ProductService;
import java.io.IOException;
import java.util.List;
import model.Category;
import service.CategoryService;

@WebServlet(name = "CategoryProductServlet", urlPatterns = {"/category-products"})
public class CategoryProductServlet extends HttpServlet {
    private ProductService productService = new ProductService();
    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryIdStr = request.getParameter("categoryId");
        List<Product> products;
        String categoryName = null;
        if (categoryIdStr != null) {
            int categoryId = Integer.parseInt(categoryIdStr);
            products = productService.getProductsByCategoryId(categoryId);
            Category category = categoryService.getCategoryById(categoryId);
            if(category != null){
                categoryName = category.getName();
            }
        } else {
            products = productService.getAllProducts();
        }
        request.setAttribute("products", products);
        request.setAttribute("categoryName",categoryName);
        request.getRequestDispatcher("product/productListByCategory.jsp").forward(request, response);
    }
} 