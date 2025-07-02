package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;
import service.OrderService;
import service.UserService;
import model.User;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderServlet", urlPatterns = {"/orders"})
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderService orderService;
    private UserService userService;

    @Override
    public void init() {
        orderService = new OrderService();
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";
        try {
            switch (action) {
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteOrder(request, response);
                    break;
                default:
                    listOrders(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                int userId = Integer.parseInt(request.getParameter("userId"));
                double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
                String status = request.getParameter("status");
                Order order = orderService.getOrderById(id);
                order.setUserId(userId);
                order.setTotalPrice(totalPrice);
                order.setStatus(status);
                orderService.modifyOrder(order);
            } catch (Exception e) {
                throw new ServletException(e);
            }
        }
        response.sendRedirect("orders");
    }

    private void listOrders(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Order> orders = orderService.getAllOrders();
        List<User> users = userService.getAllUsers();
        request.setAttribute("orders", orders);
        request.setAttribute("users", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("order/order.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        orderService.updateStatusOrder(id); // chuyển trạng thái sang Paid
        response.sendRedirect("orders");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Order order = orderService.getOrderById(id);
        List<User> users = userService.getAllUsers();
        request.setAttribute("order", order);
        request.setAttribute("users", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("order/editOrder.jsp");
        dispatcher.forward(request, response);
    }
} 