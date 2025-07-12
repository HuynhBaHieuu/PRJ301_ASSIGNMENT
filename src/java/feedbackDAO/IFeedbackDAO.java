/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package feedbackDAO;

/**
 *
 * @author phung
 */

import java.sql.SQLException;
import java.util.List;
import model.Feedback;

public interface IFeedbackDAO {
    // Thêm phản hồi mới vào cơ sở dữ liệu
    public boolean saveFeedback(String satisfaction, String reason1, String phone, String email) throws SQLException;

    // Lấy tất cả phản hồi từ cơ sở dữ liệu
    public List<Feedback> getAllFeedback() throws SQLException;

    // Lấy phản hồi theo ID
    public Feedback getFeedbackById(int id) throws SQLException;

    // Xóa phản hồi theo ID
    public boolean deleteFeedback(int id) throws SQLException;

    // Cập nhật phản hồi (nếu cần)
    public boolean updateFeedback(Feedback feedback) throws SQLException;
}

