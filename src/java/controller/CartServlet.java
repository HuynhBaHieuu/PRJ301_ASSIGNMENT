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
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.CartItem;
import model.Product;
import service.CartService;
import service.ICartService;
import service.IProductService;
import service.ProductService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/carts"})
public class CartServlet extends HttpServlet {

    private IProductService productService;
    private ICartService cartService;

    public void init() {
        productService = new ProductService();
        cartService = new CartService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        request.setAttribute("cartItems", new ArrayList<>(cart.getItems().values()));
        RequestDispatcher dispatcher = request.getRequestDispatcher("cart/cart.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
        }

        String action = request.getParameter("action");
        String rawProductId = request.getParameter("productId");
        if (rawProductId == null || rawProductId.isEmpty()) {
            response.sendRedirect("cart/cart.jsp"); // hoặc báo lỗi
            return;
        }
        int productId = Integer.parseInt(rawProductId);
//        int productId = Integer.parseInt(request.getParameter("productId"));

        switch (action) {
            case "add":
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                Product product = productService.getProductById(productId);
                if (product != null) {
                    cartService.addToCart(cart, product, quantity);
                }
                break;
            case "update":
                int newQuantity = Integer.parseInt(request.getParameter("quantity"));
                cartService.updateCartItem(cart, productId, newQuantity);
                break;
            case "remove":
                cartService.removeCartItem(cart, productId);
                break;
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart/cart2.jsp");
    }
}
