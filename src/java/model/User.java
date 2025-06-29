package model;

import java.sql.Date;

public class User {

    private int id;
    private String username;
    private String email;
    private String country;

    private String role;
    private boolean status;
    private String password;
    private Date dob;
    private String phone;
    private String googleId;
// Constructor mặc định
    public User() {
        
    }   
// Constructor đầy đủ
    
    public User(int id, String username, String email, String country, String role, boolean status, String password, Date dob, String phone, String googleId) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.country = country;
        this.role = role;
        this.status = status;
        this.password = password;
        this.dob = dob;
        this.phone = phone;
        this.googleId = googleId;
    }
    public User(int id, String username, String email, String country, String role, boolean status, String password, Date dob, String phone) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.country = country;
        this.role = role;
        this.status = status;
        this.password = password;
        this.dob = dob;
        this.phone = phone;
    }
    public User(int id, String username, String email, String country, String role, boolean status, String password, String phone, String googleId) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.country = country;
        this.role = role;
        this.status = status;
        this.password = password;
        this.phone = phone;
    }
    // checklogin
    public User(int id, String username, String email, String country, String role, String password, Date dob, String phone) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.country = country;
        this.role = role;
        this.dob = dob;
        this.password = password;
        this.phone = phone;
    }
    
    public User(int id,String username, String email, String country, String role) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.country = country;  
        this.role = role;
    }

    public String getGoogleId() {
        return googleId;
    }

    public void setGoogleId(String googleId) {
        this.googleId = googleId;
    }
    
// Getter và Setter cho các thuộc tính

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    
// Phương thức toString() để in đối tượng User
    @Override
    public String toString() {
        return "User{"
                + "id=" + id
                + ", username='" + username + '\''
                + ", email='" + email + '\''
                + ", country='" + country + '\''
                + ", role='" + role + '\''
                + ", status=" + status
                + ", password='" + password + '\''
                + ", dob='" + dob + '\''
                + ", phone='" + phone + '\''
                + '}';
    }
}
