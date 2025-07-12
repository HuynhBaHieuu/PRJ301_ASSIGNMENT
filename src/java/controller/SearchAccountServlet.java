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
@WebServlet("/search_account")
public class SearchAccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usernameOrPhone = request.getParameter("usernameOrPhone");

        UserDAO dao = new UserDAO();
        User user = dao.findUserByUsernameOrPhone(usernameOrPhone);

        if (user != null) {
            // Nếu tìm thấy người dùng, chuyển đến trang reset mật khẩu
            response.sendRedirect("reset_password.jsp?userId=" + user.getId());
        } else {
            // Nếu không tìm thấy tài khoản, trả về thông báo lỗi
            request.setAttribute("errorMessage", "Không tìm thấy tài khoản với tên đăng nhập hoặc số điện thoại này.");
            request.getRequestDispatcher("${pageContext.request.contextPath}/forgotPassword/forgot_password.jsp").forward(request, response);
        }
    }
}


