/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package userDAO;
import java.sql.SQLException;
import java.util.List;
import model.User;

/**
 *
 * @author Admin
 */
public interface IUserDAO {
    public void register(User user) throws SQLException;

    public void insertUser(User user) throws SQLException;
    
    public List<User> findByEmail(String email);

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;
}
