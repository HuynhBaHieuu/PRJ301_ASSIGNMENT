package controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.*;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONObject;
import model.User;
import service.UserService;
import userDAO.UserDAO;

@WebServlet(name = "GoogleAuthServlet", urlPatterns = {"/google-auth"})
public class GoogleAuthServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserService userService;
    
    public void init() {
        userService = new UserService();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        JSONObject jsonResponse = new JSONObject();
        
        try {
        // Đọc dữ liệu JSON từ body
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        JSONObject json = new JSONObject(sb.toString());

        String email = json.getString("email");
        String name = json.getString("name");
        String googleId = json.getString("googleId");

        // Kiểm tra user trong DB
            User user = (User) userService.findByEmail(email);
            
            if (user == null) {
                // Tạo user mới nếu chưa tồn tại
                user = new User(0, name, email, "VietNam", "user", true, "abc@123","0829495069",googleId);
                try {
                    userService.addUser(user);
                    jsonResponse.put("message", "Account created successfully");
                } catch (SQLException ex) {
                    Logger.getLogger(GoogleAuthServlet.class.getName()).log(Level.SEVERE, null, ex);
                    jsonResponse.put("success", false);
                    jsonResponse.put("message", "Error creating account");
                    response.getWriter().write(jsonResponse.toString());
                    return;
                }
            } else {
                // Cập nhật googleId nếu chưa có
                if (user.getGoogleId() == null || user.getGoogleId().isEmpty()) {
                    user.setGoogleId(googleId);
                    try {
                        userService.modifyUser(user);
                    } catch (SQLException ex) {
                        Logger.getLogger(GoogleAuthServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                jsonResponse.put("message", "Login successful");
            }

        // Set session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            jsonResponse.put("success", true);
            
        } catch (Exception e) {
            jsonResponse.put("success", false);
            jsonResponse.put("message", "An error occurred: " + e.getMessage());
        }
        
        response.getWriter().write(jsonResponse.toString());
    }
}
