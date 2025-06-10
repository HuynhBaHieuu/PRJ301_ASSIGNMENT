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
import model.Category;
import service.CategoryService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CategorySerlvet", urlPatterns = {"/categories"})
public class CategorySerlvet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryService categoryService;

    @Override
    public void init() {
        categoryService = new CategoryService();
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
//                case "delete":
//                    deleteProduct(request, response);
//                    break;
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
        Category newCategory = new Category(0, name);
        categoryService.addProduct(newCategory);

        List<Category> listProduct = categoryService.getAllProducts();
        request.setAttribute("categories", listProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("category/listCategory.jsp");
        dispatcher.forward(request, response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        
        Category category = new Category(id, name);
        categoryService.modifyProduct(category);

        List<Category> listProduct = categoryService.getAllProducts();
        request.setAttribute("categories", listProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("category/listCategory.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("category/createCategory.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Category existingProduct = categoryService.getProductById(id);
        request.setAttribute("category", existingProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("category/editCategory.jsp");
        dispatcher.forward(request, response);
    }
    private void listProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Category> listProduct = categoryService.getAllProducts();
        request.setAttribute("categories", listProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("category/listCategory.jsp");
        dispatcher.forward(request, response);
    }
}
