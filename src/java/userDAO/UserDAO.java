
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package userDAO;

import userDAO.IUserDAO;
import dao.DBConnection;
import java.util.ArrayList;
import java.util.List;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Date;

/**
 *
 * @author Admin
 */
public class UserDAO implements IUserDAO {

    private static final String LOGIN2 = "SELECT * FROM [Users] WHERE userName=? AND password=?";
    private static final String REGISTER = "INSERT INTO Users (username, email, country, password, dob, phone) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String INSERT_USER = "INSERT INTO Users (username, email, country, role, status, password, dob, phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_USER_BY_ID = "SELECT * FROM Users WHERE id = ?";
    private static final String UPDATE_USER = "UPDATE Users SET username = ?, email = ?, country = ?, role = ?, status = ?, password = ?, dob = ?, phone = ?, googleId = ? WHERE id = ?";
    private static final String SELECT_ALL_USERS = "SELECT * FROM Users";
    private static final String SEARCH_EMAILS = "SELECT * FROM Users WHERE email LIKE ?";
    private static final String DELETE_USER = "DELETE FROM Users WHERE id = ?";
    private static final String UPDATE_STATUS = "UPDATE Users SET status = ? WHERE id = ?";

    public static User checkLogin(String username, String password) {
        User us = null;
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(LOGIN2)) {

            ptm.setString(1, username);
            ptm.setString(2, password);
            ResultSet rs = ptm.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                String user = rs.getString("userName");
                String email = rs.getString("email");
                String country = rs.getString("country");
                String role = rs.getString("role");
                boolean status = rs.getBoolean("status");
                String pass = rs.getString("password");
                Date dob = rs.getDate("dob");
                String phone = rs.getString("phone");
                if (!status) {
                    return null;
                }
                us = new User(id, user, email, country, role, pass, dob, phone);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return us;
    }

    public User findUserByUsernameOrPhone(String usernameOrPhone) {
    User user = null;
    String query = "SELECT * FROM Users WHERE userName = ? OR phone = ?";

    try (Connection con = DBConnection.getConnection(); 
         PreparedStatement ptm = con.prepareStatement(query)) {
        
        ptm.setString(1, usernameOrPhone);
        ptm.setString(2, usernameOrPhone);
        ResultSet rs = ptm.executeQuery();
        
        if (rs.next()) {
            user = new User(
                rs.getInt("id"),
                rs.getString("username"),
                rs.getString("email"),
                rs.getString("country"),
                rs.getString("role"),
                rs.getInt("status") == 1,
                rs.getString("password"),
                rs.getDate("dob"),
                rs.getString("phone"),
                rs.getString("googleId")
            );
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return user;
}

    
    public boolean updatePassword(int userId, String newPassword) throws SQLException {
    String query = "UPDATE Users SET password = ? WHERE id = ?";
    try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(query)) {
        ptm.setString(1, newPassword);
        ptm.setInt(2, userId);
        int rowsUpdated = ptm.executeUpdate();
        return rowsUpdated > 0;
    }
}

    
    @Override
    public void register(User user) throws SQLException {
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(REGISTER)) {

            ptm.setString(1, user.getUsername());
            ptm.setString(2, user.getEmail());
            ptm.setString(3, user.getCountry());
            ptm.setString(4, user.getPassword());
            ptm.setDate(5, user.getDob());
            ptm.setString(6, user.getPhone());
            ptm.executeUpdate();
        }
    }

    public List<User> findByEmail(String email) {
        List<User> users = new ArrayList<>();
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(SEARCH_EMAILS)) {

            ptm.setString(1, "%" + email + "%");
            ResultSet rs = ptm.executeQuery();

            while (rs.next()) {
                User u = new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("country"),
                        rs.getString("role"),
                        rs.getInt("status") == 1,
                        rs.getString("password"),
                        rs.getDate("dob"),
                        rs.getString("phone"),
                        rs.getString("googleId")
                );
                users.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public void insertUser(User user) throws SQLException {
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(INSERT_USER)) {

            ptm.setString(1, user.getUsername());
            ptm.setString(2, user.getEmail());
            ptm.setString(3, user.getCountry());
            ptm.setString(4, user.getRole());
            ptm.setBoolean(5, user.getStatus());
            ptm.setString(6, user.getPassword());
            ptm.setDate(7, user.getDob());
            ptm.setString(8, user.getPhone());
//            ptm.setString(9, user.getGoogleId());
            ptm.executeUpdate();
        }
    }

    @Override
    public User selectUser(int id) {
        User u = null;
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(SELECT_USER_BY_ID)) {

            ptm.setInt(1, id);
            ResultSet rs = ptm.executeQuery();

            if (rs.next()) {
                u = new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("country"),
                        rs.getString("role"),
                        rs.getInt("status") == 1,
                        rs.getString("password"),
                        rs.getDate("dob"),
                        rs.getString("phone"),
                        rs.getString("googleId")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(SELECT_ALL_USERS); ResultSet rs = ptm.executeQuery()) {

            while (rs.next()) {
                User u = new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("country"),
                        rs.getString("role"),
                        rs.getInt("status") == 1,
                        rs.getString("password"),
                        rs.getDate("dob"),
                        rs.getString("phone"),
                        rs.getString("googleId")
                );
                users.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(DELETE_USER)) {

            ptm.setInt(1, id);
            rowDeleted = ptm.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(UPDATE_USER)) {

            ptm.setString(1, user.getUsername());
            ptm.setString(2, user.getEmail());
            ptm.setString(3, user.getCountry());
            ptm.setString(4, user.getRole());
            ptm.setBoolean(5, user.getStatus());
            ptm.setString(6, user.getPassword());
            ptm.setDate(7, user.getDob());
            ptm.setString(8, user.getPhone());
            ptm.setString(9, user.getGoogleId());
            ptm.setInt(10, user.getId());

            rowUpdated = ptm.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public void updateStatus(int id, boolean status) throws SQLException {
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(UPDATE_STATUS)) {
            ps.setInt(1, status ? 1 : 0);
            ps.setInt(2, id);
            ps.executeUpdate();
        }
    }

    public static void main(String[] args) throws SQLException {
        UserDAO dao = new UserDAO();
        //checklogin
        User user = checkLogin("Chi Pheo", "abc@123");
        if (user != null) {
            System.out.println("Login success! Welcome " + user.getUsername());
        } else {
            System.out.println("Login failed.");
        }
        //searchUser
        User user1 = dao.selectUser(2);
        System.out.println("Username: " + user1.getUsername());
        //insert
//        User user2 = new User(0, "huynhbahieu", "hieu123@gmail.com", "vietnam", "Admin", true, "abc@123", Date.valueOf("2005-01-07"),"0123456789");
//        dao.insertUser(user2);
        //selectAllUser
//        List<User> user3 = dao.selectAllUsers();
//        if (user3.isEmpty()) {
//            System.out.println("Not found any user in system.");
//        } else {
//            for (User users : user3) {
//                System.out.println("ID: " + users.getId());
//                System.out.println("Username: " + users.getUsername());
//                System.out.println("Email: " + users.getEmail());
//                System.out.println("Country: " + users.getCountry());
//                System.out.println("Role: " + users.getRole());
//                System.out.println("Status: " + users.getStatus());
//                System.out.println("Password: " + users.getPassword());
//                System.out.println("DOB: " + users.getDob());
//                System.out.println("Phone: " + users.getPhone());
//                System.out.println("-------------------------");
//            }
//        }
//        //delete
//        try {
//            boolean result = dao.deleteUser(3);  // xóa user có id = 3
//            if (result) {
//                System.out.println("Delete user successful!");
//            } else {
//                System.out.println("Not found user.");
//            }
//        } catch (SQLException e) {
//            System.out.println("Error during delete user: " + e.getMessage());
//        }
        //update
//        try {
//            // Tạo 1 user mới với ID tồn tại, thay đổi thông tin
//            User updateUser = new User(
//                    8,
//                    "updatedname",
//                    "updatedemail@gmail.com",
//                    "USA",
//                    "User",
//                    false,
//                    "newpass123",
//                    Date.valueOf("2000-12-25"),
//                    "0000111123"
//            );
//
//            boolean updated = dao.updateUser(updateUser);
//            if (updated) {
//                System.out.println("Update user successful!");
//            } else {
//                System.out.println("Not found user.");
//            }
//        } catch (SQLException e) {
//            System.out.println("Update error: " + e.getMessage());
//        }
    }
}
