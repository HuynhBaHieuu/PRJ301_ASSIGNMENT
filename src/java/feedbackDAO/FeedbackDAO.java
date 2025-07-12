/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package feedbackDAO;

/**
 *
 * @author phung
 */

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Feedback;
import dao.DBConnection;

public class FeedbackDAO implements IFeedbackDAO {
    
    private static final String INSERT_FEEDBACK = "INSERT INTO feedback (satisfaction, reason1, phone, email) VALUES (?, ?, ?, ?)";
    private static final String SELECT_ALL_FEEDBACK = "SELECT * FROM feedback";
    private static final String SELECT_FEEDBACK_BY_ID = "SELECT * FROM feedback WHERE id = ?";
    private static final String DELETE_FEEDBACK = "DELETE FROM feedback WHERE id = ?";
    private static final String UPDATE_FEEDBACK = "UPDATE feedback SET satisfaction = ?, reason1 = ?, phone = ?, email = ? WHERE id = ?";

    @Override
    public boolean saveFeedback(String satisfaction, String reason1, String phone, String email) throws SQLException {
        try (Connection con = DBConnection.getConnection(); 
             PreparedStatement ptm = con.prepareStatement(INSERT_FEEDBACK)) {
            
            ptm.setString(1, satisfaction);
            ptm.setString(2, reason1);
            ptm.setString(3, phone);
            ptm.setString(4, email);
            
            int rowsAffected = ptm.executeUpdate();
            return rowsAffected > 0;  // Trả về true nếu lưu thành công
        }
    }

    @Override
    public List<Feedback> getAllFeedback() throws SQLException {
        List<Feedback> feedbacks = new ArrayList<>();
        try (Connection con = DBConnection.getConnection(); 
             PreparedStatement ptm = con.prepareStatement(SELECT_ALL_FEEDBACK);
             ResultSet rs = ptm.executeQuery()) {
            
            while (rs.next()) {
                Feedback feedback = new Feedback(
                        rs.getInt("id"),
                        rs.getString("satisfaction"),
                        rs.getString("reason1"),
                        rs.getString("phone"),
                        rs.getString("email")
                );
                feedbacks.add(feedback);
            }
        }
        return feedbacks;
    }

    @Override
    public Feedback getFeedbackById(int id) throws SQLException {
        Feedback feedback = null;
        try (Connection con = DBConnection.getConnection(); 
             PreparedStatement ptm = con.prepareStatement(SELECT_FEEDBACK_BY_ID)) {
            
            ptm.setInt(1, id);
            ResultSet rs = ptm.executeQuery();
            
            if (rs.next()) {
                feedback = new Feedback(
                        rs.getInt("id"),
                        rs.getString("satisfaction"),
                        rs.getString("reason1"),
                        rs.getString("phone"),
                        rs.getString("email")
                );
            }
        }
        return feedback;
    }

    @Override
    public boolean deleteFeedback(int id) throws SQLException {
        try (Connection con = DBConnection.getConnection(); 
             PreparedStatement ptm = con.prepareStatement(DELETE_FEEDBACK)) {
            
            ptm.setInt(1, id);
            int rowsAffected = ptm.executeUpdate();
            return rowsAffected > 0;  // Trả về true nếu xóa thành công
        }
    }

    @Override
    public boolean updateFeedback(Feedback feedback) throws SQLException {
        try (Connection con = DBConnection.getConnection(); 
             PreparedStatement ptm = con.prepareStatement(UPDATE_FEEDBACK)) {
            
            ptm.setString(1, feedback.getSatisfaction());
            ptm.setString(2, feedback.getReason1());
            ptm.setString(3, feedback.getPhone());
            ptm.setString(4, feedback.getEmail());
            ptm.setInt(5, feedback.getId());
            
            int rowsAffected = ptm.executeUpdate();
            return rowsAffected > 0;  // Trả về true nếu cập nhật thành công
        }
    }
}

