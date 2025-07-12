/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author phung
 */
@WebServlet("/reset_password")
public class ResetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (newPassword.equals(confirmPassword)) {
            try {
                UserDAO dao = new UserDAO();
                boolean isUpdated = dao.updatePassword(Integer.parseInt(userId), newPassword);
                if (isUpdated) {
                    response.getWriter().write("Mật khẩu của bạn đã được thay đổi thành công.");
                } else {
                    response.getWriter().write("Đã có lỗi xảy ra trong quá trình cập nhật mật khẩu.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().write("Đã có lỗi xảy ra trong quá trình cập nhật mật khẩu.");
            }
        } else {
            response.getWriter().write("Mật khẩu nhập lại không đúng.");
        }
    }
}




