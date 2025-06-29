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

    /**
     *
     * @author Admin
     */
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
            // Kiểm tra session và role của người dùng
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");

            // Lấy danh sách sản phẩm từ cơ sở dữ liệu
            //        List<Product> listProduct = productService.getAllProducts();
            //        request.setAttribute("products", listProduct); // Truyền sản phẩm vào request
            List<Category> categories = categoryService.getAllCategories();
            request.setAttribute("categories", categories);

            String categoryIdStr = request.getParameter("categoryId");
            List<Product> listProduct;

            if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
                try {
                    int categoryId = Integer.parseInt(categoryIdStr);
                    listProduct = productService.getProductsByCategoryId(categoryId);
                } catch (NumberFormatException e) {
                    listProduct = productService.getAllProducts(); // fallback nếu lỗi
                }
            } else {
                listProduct = productService.getAllProducts();
            }
            Map<Category, List<Product>> groupedProducts = new LinkedHashMap<>();
            categories = categoryService.getAllCategories();

            for (Category category : categories) {
                List<Product> products = productService.getProductsByCategoryId(category.getCategoryId());
                groupedProducts.put(category, products);
            }

            request.setAttribute("groupedProducts", groupedProducts);

            request.setAttribute("products", listProduct);
            RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
            dispatcher.forward(request, response);
        }

    }
