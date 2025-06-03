/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.DBConnection;
import userDAO.UserDAO;
import model.User;
import java.sql.SQLException;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

/**
 *
 * @author Admin
 */
public class UserService implements IUserService{

    private UserDAO userDAO;

    public UserService() {
        userDAO = new UserDAO();
    }
    
    public void addUser(User user) throws SQLException {
        userDAO.insertUser(user);
    }

    public void modifyUser(User user) throws SQLException {
        userDAO.updateUser(user);
    }

    public void removeUser(int id) throws SQLException {
        userDAO.deleteUser(id);
    }

    public User getUserById(int id) {
        return userDAO.selectUser(id);
    }

    public List<User> getAllUsers() {
        return userDAO.selectAllUsers();
    }

    public void updateUserStatus(int id, boolean status) throws SQLException {
        userDAO.updateStatus(id, status);
    }
}
