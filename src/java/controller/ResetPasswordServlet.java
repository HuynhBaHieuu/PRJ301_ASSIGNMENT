/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import service.UserService;

/**
 *
 * @author Administrator
 */

@WebServlet("/reset-password")
public class ResetPasswordServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String newPass = request.getParameter("newPassword");
        String confirmPass = request.getParameter("confirmPassword");

        if (email == null || email.trim().isEmpty()) {
            request.getSession().setAttribute("resetErrorMessage", "Vui lòng nhập email.");
            response.sendRedirect(request.getContextPath() + "/forgotPassword/resetPasswordForm.jsp");
            return;
        }

        if (!newPass.equals(confirmPass)) {
            request.getSession().setAttribute("resetErrorMessage", "Mật khẩu không khớp.");
            request.getSession().setAttribute("resetEmail", email);
            response.sendRedirect(request.getContextPath() + "/forgotPassword/resetPasswordForm.jsp");
            return;
        }

        System.out.println("🔍 Đang tìm user theo email: " + email);
        List<User> users = userService.findByEmail(email);
        if (users != null && !users.isEmpty()) {
            User user = users.get(0);
            user.setPassword(newPass); // Hash nếu cần
            try {
                userService.modifyUser(user);
                request.getSession().removeAttribute("resetEmail"); // ✅ xóa session sau khi xong
                response.sendRedirect(request.getContextPath() + "/forgotPassword/resetSuccess.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                request.getSession().setAttribute("resetErrorMessage", "Cập nhật mật khẩu thất bại.");
                request.getSession().setAttribute("resetEmail", email);
                response.sendRedirect(request.getContextPath() + "/forgotPassword/resetPasswordForm.jsp");
            }
        } else {
            request.getSession().setAttribute("resetErrorMessage", "Email không hợp lệ.");
            request.getSession().setAttribute("resetEmail", email);
            response.sendRedirect(request.getContextPath() + "/forgotPassword/resetPasswordForm.jsp");
        }
    }
}