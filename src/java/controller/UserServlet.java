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
import model.User;
import java.sql.SQLException;
import userDAO.UserDAO;
import service.UserService;
import java.sql.Date;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    private UserService userService;

    public void init() {
        userDAO = new UserDAO();
        userService = new UserService();
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertUser(request, response);
                    break;
                case "edit":
                    updateUser(request, response);
                    break;
            }
        } catch (SQLException ex) {

            throw new ServletException(ex);
        }
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
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
                    deleteUser(request, response);
                    break;
                default:
                    listUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        String role = request.getParameter("role");
        boolean status = request.getParameter("status") != null;
        String password = request.getParameter("password");
        Date dob = Date.valueOf(request.getParameter("dob"));
        String phone = request.getParameter("phone");

        if (username == null || email == null || country == null || password == null || phone == null) {
            throw new ServletException();
        }
        User newUser = new User(0, username, email, country, role, status, password, dob, phone);
        userService.addUser(newUser);
        List<User> listUser = userService.getAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/listUser.jsp");
        dispatcher.forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        String role = request.getParameter("role");
        boolean status = request.getParameter("status") != null;
        String password = request.getParameter("password");
        Date dob = Date.valueOf(request.getParameter("dob"));
        String phone = request.getParameter("phone");
        if (username == null || email == null || country == null || password == null || dob == null || phone  == null) {
            throw new ServletException();
        }
        User user = new User(id, username, email, country, role, status, password, dob, phone);
        userService.modifyUser(user);
        List<User> listUser = userService.getAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("user/listUser.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("user/createUser.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userService.getUserById(id);
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("user/editUser.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
//        userService.removeUser(id);
// Cập nhật trạng thái thành unactive (status = false)
        userService.updateUserStatus(id, false);
        List<User> listUser = userService.getAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("user/listUser.jsp");
        dispatcher.forward(request, response);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> listUser = userService.getAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("user/listUser.jsp");
        dispatcher.forward(request, response);
    }
}
