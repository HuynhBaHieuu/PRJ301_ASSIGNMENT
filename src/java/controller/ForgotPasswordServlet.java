/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import service.UserService;
import utils.EmailUtil;

/**
 *
 * @author Administrator
 */
@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        List<User> users = userService.findByEmail(email);

        if (users == null || users.isEmpty()) {
            request.getSession().setAttribute("forgotErrorMessage", "Email không tồn tại trong hệ thống.");
            request.getSession().setAttribute("forgotEmail", email);
            response.sendRedirect(request.getContextPath() + "/forgotPassword/forgotPassword.jsp");
        } else {
            // ✅ Gửi email chứa link reset
//            String resetLink = request.getRequestURL().toString().replace("forgot-password", "reset-password-form") + "?email=" + URLEncoder.encode(email, "UTF-8");
//            String resetLink = request.getContextPath() + "/forgotPassword/resetPasswordForm.jsp?email=" + URLEncoder.encode(email, "UTF-8");
                User user = users.get(0);

                String resetLink = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/forgotPassword/resetPasswordForm.jsp?email=" + URLEncoder.encode(email, "UTF-8");
//                String html = "<p>Hi " + user.getUsername()
//                        + ",<br>You recently requested to reset the password for your localhost:8080 account. Click the link below to proceed.</p>"
//                        + "<br><br><a href='" + resetLink + "'>Reset password</a>"
//                        + "<br><br><p>If you did not request a password reset, please ignore this email or reply to let us know. This password reset link is only valid for the next 30 minutes.<br><br>Thanks,<br><b>Nông sản tương lai</b></p>";
                String html = ""
                    + "<div style='font-size:20px; font-family:sans-serif;'>"
                    + "<p>Hi " + user.getUsername() + ",<br><br></p>"
                    + "<p>You recently requested to reset the password for your localhost:4000 account. Click the link below to proceed.<br><br></p>"
                    + "<p><a href='" + resetLink + "'>Reset password</a><br><br></p>"
                    + "<p>If you did not request a password reset, please ignore this email or reply to let us know. "
                    + "This password reset link is only valid for the next 30 minutes.<br><br></p>"
                    + "<p>Thanks,<br><br><b>Nông sản tương lai</b></p>"
                    + "</div>";;
            try {
                EmailUtil.sendEmail(email, "Reset Your Password", html);
                request.getSession().setAttribute("forgotSuccessMessage", "Chúng tôi đã gửi liên kết đặt lại mật khẩu vào email của bạn!");
            } catch (MessagingException e) {
                request.getSession().setAttribute("forgotErrorMessage", "Lỗi khi gửi email. Vui lòng thử lại.");
                request.getSession().setAttribute("forgotEmail", email);
                response.sendRedirect(request.getContextPath() + "/forgotPassword/forgotPassword.jsp");
            }
//            request.getSession().setAttribute("forgotEmail", email);
            response.sendRedirect(request.getContextPath() + "/forgotPassword/forgotSuccess.jsp");

        }
    }
}
