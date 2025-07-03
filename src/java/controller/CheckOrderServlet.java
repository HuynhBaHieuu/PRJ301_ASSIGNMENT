/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Order;
import model.OrderDetailInfo;
import orderDAO.CheckOrderDao;

/**
 *
 * @author Administrator
 */
@WebServlet("/checkOrder")
public class CheckOrderServlet extends HttpServlet {
    private CheckOrderDao dao;

    @Override
    public void init() {
        dao = new CheckOrderDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        String recaptcha = request.getParameter("g-recaptcha-response");
        String phone = request.getParameter("phonenumber");
        
         // 1. Kiểm tra nếu người dùng ko nhập gì      
        if (recaptcha == null && phone == null || recaptcha == null && phone.trim().isEmpty() || recaptcha.trim().isEmpty() && phone == null || recaptcha.trim().isEmpty() && phone.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập đủ và đúng các thông tin cần thiết.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("productItem/checkOrder.jsp");
            dispatcher.forward(request, response);
            return;
        }
        // 2. Kiểm tra nếu chỉ nhập sdt mà ko tick
        if (recaptcha == null || recaptcha.trim().isEmpty()) {
            request.setAttribute("error", "Hãy click chọn recaptcha.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("productItem/checkOrder.jsp");
            dispatcher.forward(request, response);
            return;
        }
        // 3. Kiểm tra nếu chỉ tick mà ko nhập sdt 
        if (phone == null || phone.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập số điện thoại.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("productItem/checkOrder.jsp");
            dispatcher.forward(request, response);
            return;
        }
        // 4. Kiểm tra nếu nhập sdt ko đúng 10 số
        if (phone.length() != 10) {
            request.setAttribute("error", "Số điện thoại không hợp lệ.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("productItem/checkOrder.jsp");
            dispatcher.forward(request, response);
            return;
        }

        boolean userExists = dao.userExists(phone);
        if (!userExists) {
            request.setAttribute("error", "Không tìm thấy số điện thoại.");
        } else {
            List<OrderDetailInfo> detailInfos = dao.getOrderDetailsByPhone(phone);
            if (detailInfos.isEmpty()) {
                request.setAttribute("message", "Không có đơn hàng nào.");
            } else {
                request.setAttribute("details", detailInfos);
            }
        }

        request.setAttribute("phone", phone); // Giữ lại số vừa nhập
        RequestDispatcher dispatcher = request.getRequestDispatcher("productItem/checkOrder.jsp");
        dispatcher.forward(request, response);
    }
}
