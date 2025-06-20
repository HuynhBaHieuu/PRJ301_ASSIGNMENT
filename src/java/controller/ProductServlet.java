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
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import model.Product;
import service.ProductService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/products"})
public class ProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ProductService productService;

    @Override
    public void init() {
        productService = new ProductService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "create":
                    insertProduct(request, response);
                    break;
                case "edit":
                    updateProduct(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                default:
                    listProduct(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        int stock = Integer.parseInt(request.getParameter("stock"));
//        Date importDate = Date.valueOf(request.getParameter("importDate"));
        boolean status = request.getParameter("status") != null;
        int category_id = Integer.parseInt(request.getParameter("categoryId"));
        String imageURL = request.getParameter("imageUrl");
        
        Product newProduct = new Product(0, name, price, description, stock, status, category_id, imageURL);
        productService.addProduct(newProduct);

        List<Product> listProduct = productService.getAllProducts();
        request.setAttribute("products", listProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/productList.jsp");
        dispatcher.forward(request, response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        int stock = Integer.parseInt(request.getParameter("stock"));
        Date importDate = Date.valueOf(request.getParameter("importDate"));
        boolean status = request.getParameter("status") != null;
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String imageURL = request.getParameter("imageUrl");
        
        Product product = new Product(id, name, price, description, stock, importDate, status, categoryId, imageURL);
        productService.modifyProduct(product);

        List<Product> listProduct = productService.getAllProducts();
        request.setAttribute("products", listProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/productList.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/createProduct.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product existingProduct = productService.getProductById(id);
        request.setAttribute("product", existingProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/editProduct.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.removeProduct(id, false); // cập nhật status = false
        List<Product> listProduct = productService.getAllProducts();
        request.setAttribute("products", listProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/productList.jsp");
        dispatcher.forward(request, response);
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> listProduct = productService.getAllProducts();
        request.setAttribute("products", listProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/productList.jsp");
        dispatcher.forward(request, response);
    }
}
