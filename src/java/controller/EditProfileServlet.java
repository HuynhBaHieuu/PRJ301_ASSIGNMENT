package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

import model.User;
import service.UserService;

@WebServlet(name = "EditProfileServlet", urlPatterns = {"/editProfile"})
public class EditProfileServlet extends HttpServlet {
    private UserService userService;

    public void init() {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy thông tin user từ session
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Gửi user sang trang edit
        request.setAttribute("user", currentUser);
        request.getRequestDispatcher("user/editUser2.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Nhận dữ liệu từ form
            int id = currentUser.getId(); // dùng ID hiện tại
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String country = request.getParameter("country");
            String password = request.getParameter("password");
            Date dob = Date.valueOf(request.getParameter("dob"));
            String phone = request.getParameter("phone");

            // Cập nhật user
            User updatedUser = new User(id, username, email, country, currentUser.getRole(), true, password, dob, phone, "");
            userService.modifyUser(updatedUser);

            // Gán lại vào session
            session.setAttribute("user", updatedUser);

            // Quay về home
            response.sendRedirect(request.getContextPath() + "/home");
        } catch (Exception e) {
            request.setAttribute("error", "Cập nhật thất bại: " + e.getMessage());
            request.getRequestDispatcher("user/editUser2.jsp").forward(request, response);
        }
    }
}
