/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import model.User;
import userDAO.UserDAO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    private UserDAO userDAO = new UserDAO();    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy thông tin từ form login
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String remember = request.getParameter("remember"); // checkbox remember

        // Kiểm tra thông tin đăng nhập từ cơ sở dữ liệu
        User user = UserDAO.checkLogin(username, password);

        if (user != null) {
            // Tạo session lưu thông tin user
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            try {
                // Mã hóa username và password để đảm bảo dữ liệu không có ký tự đặc biệt hoặc dấu cách
                String encodedUsername = URLEncoder.encode(username, "UTF-8");
                String encodedPassword = URLEncoder.encode(password, "UTF-8");

                // Xử lý Remember Me
                if ("on".equals(remember)) {
                    // Lưu username và password vào cookie
                    Cookie userCookie = new Cookie("username", encodedUsername);
                    userCookie.setMaxAge(7 * 24 * 60 * 60);  // 7 ngày
                    userCookie.setPath(request.getContextPath());
                    response.addCookie(userCookie);

                    Cookie passCookie = new Cookie("password", encodedPassword);
                    passCookie.setMaxAge(7 * 24 * 60 * 60);  // 7 ngày
                    passCookie.setPath(request.getContextPath());
                    response.addCookie(passCookie);
                } else {
                    // Chỉ lưu username và xóa mật khẩu cookie nếu không chọn "Remember me"
                    Cookie userCookie = new Cookie("username", encodedUsername);
                    userCookie.setMaxAge(24 * 60 * 60);  // 1 ngày
                    userCookie.setPath(request.getContextPath());
                    response.addCookie(userCookie);

                    Cookie passCookie = new Cookie("password", "");
                    passCookie.setMaxAge(0);  // Xóa cookie password
                    passCookie.setPath(request.getContextPath());
                    response.addCookie(passCookie);
                }
                if ("admin".equals(user.getRole())) {
                    // Nếu là admin, chuyển đến trang danh sách sản phẩm
                    response.sendRedirect("products");
                } else if ("user".equals(user.getRole())) {
                    // Nếu là user, chuyển đến trang home
                    response.sendRedirect("home");
                }

            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
                // Xử lý lỗi khi mã hóa
            }

        } else {
            // Đăng nhập sai, gửi về lại login với lỗi
            request.setAttribute("errorMessage", "Invalid username, password or account is inactive");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
