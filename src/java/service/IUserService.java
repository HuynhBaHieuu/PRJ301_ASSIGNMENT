package service;

import model.User;
import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    void register(User user) throws SQLException;
    
    void addUser(User user) throws SQLException;

    void modifyUser(User user) throws SQLException;

    void removeUser(int id) throws SQLException;

    User getUserById(int id);

    List<User> getAllUsers();

    void updateUserStatus(int id, boolean status) throws SQLException;
}
