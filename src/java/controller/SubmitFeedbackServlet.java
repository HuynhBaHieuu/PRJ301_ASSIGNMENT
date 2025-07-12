/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import feedbackDAO.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phung
 */
@WebServlet("/submitFeedback")
public class SubmitFeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String satisfaction = request.getParameter("satisfaction");
        String reason1 = request.getParameter("reason1");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        // Kiểm tra xem tất cả các tham số có hợp lệ không
        if (satisfaction != null && reason1 != null && phone != null && email != null) {
            FeedbackDAO feedbackDAO = new FeedbackDAO();
            try {
                // Gọi phương thức để lưu phản hồi vào cơ sở dữ liệu
                boolean isSaved = feedbackDAO.saveFeedback(satisfaction, reason1, phone, email);
                if (isSaved) {
                    // Hiển thị thông báo thành công
                    response.getWriter().write("Cảm ơn bạn! Phản hồi của bạn đã được ghi lại.");
                } else {
                    // Hiển thị thông báo lỗi nếu không thể lưu
                    response.getWriter().write("Đã xảy ra lỗi khi lưu phản hồi.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().write("Lỗi kết nối cơ sở dữ liệu.");
            }
        } else {
            response.getWriter().write("Vui lòng điền đầy đủ thông tin.");
        }
    }
}



